module DynamicPDFApi
  require "stringio"

  class FullNameTable
    attr_reader :_name
    def initialize(io, table_directory, position)

      if table_directory != nil
        int_offset = read_ulong(table_directory, position + 8)
        int_length = read_ulong(table_directory, position + 12)

        io.seek(int_offset, IO::SEEK_SET)
        @data = io.read(int_length).b
      end

      @_name = ""

      dataStart = read_ushort(4)
      headerStart = 6
      headerEnd = (read_ushort(2)* 12)

      (headerStart...headerEnd).step(12) do |i|
        if read_ushort(i + 6) == 4  # 4 is the Name ID for Full font name
          if read_ushort(i) == 3 && read_ushort(i + 2) == 1 && read_ushort(i + 4) == 0x0409 # 3 for PlatForm ID, 1 for Encoding ID and 0x0409 Language ID for English(United States)
            offset = read_ushort(i + 10)
            length = read_ushort(i + 8)
            raw_bytes = @data[dataStart + offset, length]
            if raw_bytes
              decoded = raw_bytes.dup.force_encoding("UTF-16BE").encode("UTF-8", invalid: :replace, undef: :replace).strip
              @_name = decoded
              break unless @_name.empty?
            end
          end
        end
      end

      if @_name.empty?
        (headerStart...headerEnd).step(12) do |i|
          if read_ushort(i + 6) == 4  # 4 is the Name ID for Full font name
            if read_ushort(i) == 3 # 3 for PlatForm ID, 0 for Encoding ID and 0x0409 Language ID for English(United States)
              offset = read_ushort(i + 10)
              length = read_ushort(i + 8)
              raw_bytes = @data[dataStart + offset, length]
              if raw_bytes
                decoded = raw_bytes.dup.force_encoding("UTF-16BE").encode("UTF-8", invalid: :replace, undef: :replace).strip
                @_name = decoded
                break
              end
            end
          end
        end
      end

      # Remove spaces and hyphens
      @_name.gsub!(/[ -]/, "") unless @_name.nil?
    end


    def read_ushort(index)
      @data[index, 2]&.unpack1("n") || 0
    end

    def read_ulong(array, index)
      array[index, 4].unpack1("N")
    end
  end
end
