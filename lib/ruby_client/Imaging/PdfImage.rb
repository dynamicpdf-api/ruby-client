module DynamicPDFApi

  require "net/http"
  require "net/https"
  require "uri"
  require "json"
  require "openssl"

  require_relative '..\Endpoint'
  require_relative '..\PdfResource'
  require_relative '..\EndPointException'
  require_relative "PdfImageResponse"
  require_relative "ImageFormat"
  require_relative "ImageSize"

  # Represents a PDF Rasterizing endpoint that converts PDF to image.
  class PdfImage < Endpoint

    #
    # Represents a PdfResource for converting PDF pages to images.
    #
    attr_reader :resource

    #
    # Gets or sets the starting page number for rasterization.
    #
    attr_accessor :start_page_number

    #
    # Gets or sets the number of pages to rasterize.
    #
    attr_accessor :page_count

    #
    # Gets or sets the image format for rasterization.
    #
    attr_accessor :image_format

    #
    # Gets or sets the size of the rasterized images.
    #
    attr_accessor  :image_size

    def initialize(resource)
      @resource = resource
      @_endpoint_name = 'pdf-image'
    end

    def process
      header = {
        'authorization': "Bearer #{@api_key}",
        'Expect': "100-continue",
      }
      uri = URI.parse("#{@base_url}/v1.0/#{@_endpoint_name}")
      params = {}
      if @start_page_number!=nil
        params['sp'] = @start_page_number
        params['pc'] = @page_count
      end

      # Adding ImageSize parameters if @image_size is present
      if @image_size
        case @image_size
        when DpiImageSize
          params['is'] = @image_size.type.to_s
          params['hd'] = @image_size.horizontal_dpi.to_s if @image_size.horizontal_dpi
          params['vd'] = @image_size.vertical_dpi.to_s if @image_size.vertical_dpi
        when FixedImageSize
          params['is'] = @image_size.type.to_s
          params['ht'] = @image_size.height.to_s if @image_size.height
          params['wd'] = @image_size.width.to_s if @image_size.width
          params['ut'] = @image_size.unit.to_s if @image_size.unit
        when MaxImageSize
          params['is'] = @image_size.type.to_s
          params['mh'] = @image_size.max_height.to_s if @image_size.max_height
          params['mw'] = @image_size.max_width.to_s if @image_size.max_width
          params['ut'] = @image_size.unit.to_s if @image_size.unit
        when PercentageImageSize
          params['is'] = @image_size.type.to_s
          params['hp'] = @image_size.horizontal_percentage.to_s if @image_size.horizontal_percentage
          params['vp'] = @image_size.vertical_percentage.to_s if @image_size.vertical_percentage
        end
      end

      # Adding ImageFormat parameters if @image_format is present
      if @image_format
        case @image_format
        when GifImageFormat
          params['if'] = @image_format.type.to_s
          params['dp'] = @image_format.dithering_percent.to_s if @image_format.dithering_percent
          params['da'] = @image_format.dithering_algorithm.to_s if @image_format.dithering_algorithm
        when JpegImageFormat
          params['if'] = @image_format.type.to_s
          params['qt'] = @image_format.quality.to_s if @image_format.quality
        when PngImageFormat
          params['if'] = @image_format.type.to_s
          if @image_format.color_format
            params['cf'] = @image_format.color_format.type.to_s
            case @image_format.color_format
            when PngIndexedColorFormat
              params['da'] = @image_format.color_format.dithering_algorithm.to_s if @image_format.color_format.dithering_algorithm
              params['dp'] = @image_format.color_format.dithering_percent.to_s if @image_format.color_format.dithering_percent
              params['qa'] = @image_format.color_format.quantization_algorithm.to_s if @image_format.color_format.quantization_algorithm
            when PngMonochromeColorFormat
              params['bt'] = @image_format.color_format.black_threshold.to_s if @image_format.color_format.black_threshold
              params['da'] = @image_format.color_format.dithering_algorithm.to_s if @image_format.color_format.dithering_algorithm
              params['dp'] = @image_format.color_format.dithering_percent.to_s if @image_format.color_format.dithering_percent
            end
          end
        when TiffImageFormat
          params['if'] = @image_format.type.to_s
          params['mp'] = 'true' if @image_format.multi_page
          if @image_format.color_format
            params['cf'] = @image_format.color_format.type.to_s
            case @image_format.color_format
            when TiffIndexedColorFormat
              params['da'] = @image_format.color_format.dithering_algorithm.to_s if @image_format.color_format.dithering_algorithm
              params['dp'] = @image_format.color_format.dithering_percent.to_s if @image_format.color_format.dithering_percent
              params['qa'] = @image_format.color_format.quantization_algorithm.to_s if @image_format.color_format.quantization_algorithm
            when TiffMonochromeColorFormat
              params['ct'] = @image_format.color_format.compression_type.to_s if @image_format.color_format.compression_type
              params['bt'] = @image_format.color_format.black_threshold.to_s if @image_format.color_format.black_threshold
              params['da'] = @image_format.color_format.dithering_algorithm.to_s if @image_format.color_format.dithering_algorithm
              params['dp'] = @image_format.color_format.dithering_percent.to_s if @image_format.color_format.dithering_percent
            end
          end
        when BmpImageFormat
          params['if'] = @image_format.type.to_s
          if @image_format.color_format
            params['cf'] = @image_format.color_format.type.to_s
            case @image_format.color_format
            when BmpMonochromeColorFormat
              params['bt'] = @image_format.color_format.black_threshold.to_s if @image_format.color_format.black_threshold
              params['dp'] = @image_format.color_format.dithering_percent.to_s if @image_format.color_format.dithering_percent
              params['da'] = @image_format.color_format.dithering_algorithm.to_s if @image_format.color_format.dithering_algorithm
            end
          end
        end
      end

      uri.query = URI.encode_www_form(params)

      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.set_form_data(params)
      req_options = {
        use_ssl: uri.scheme == 'https',
        verify_mode: OpenSSL::SSL::VERIFY_NONE
      }

      resource_array = []
      resource_array << ['pdf', @resource.data, { content_type: @resource._mime_type, filename: @resource.resource_name }] if !@resource.nil?

      request.set_form(resource_array, "multipart/form-data")

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      rasterizer_response = PdfImageResponse.new
      if @resource == nil
        raise 'Required a PDF Resource.'
      end
      rasterizer_response.status_code = response.code
      out_data = response.body
      if rasterizer_response.status_code == "200"
        pdf_image = JSON.parse(out_data)

        image_type = pdf_image['contentType']
        rasterizer_response.image_format = image_type.split('/')[1]
        rasterizer_response.content_type = image_type
        rasterizer_response.horizontal_dpi = pdf_image['horizontalDpi']
        rasterizer_response.vertical_dpi = pdf_image['verticalDpi']

        pdf_image['images'].each do |img|
          image = Image.new
          image.page_number = img['pageNumber'] || 0
          image.data = img['data'] || ''
          image.billed_pages = img['billedPages'] || 0
          image.width = img['width'] || 0
          image.height = img['height'] || 0
          rasterizer_response.images << image
        end

        rasterizer_response.status_code = response.code
        rasterizer_response.is_successful = true
      else
        if rasterizer_response.status_code == '401'
          raise "Invalid api key specified."
        end
        out_data_json = JSON.parse(out_data)
        rasterizer_response.error_json = out_data
        rasterizer_response.error_message = if !out_data_json["message"].nil?
          out_data_json["message"]
        else
          "status_code : #{Net::HTTPResponse::CODE_TO_OBJ[rasterizer_response.status_code]}"
        end
        rasterizer_response.error_id = out_data_json["id"]
        rasterizer_response.is_successful = false
      end

      rasterizer_response
    end

    def to_json(_options = {})
      json_array = {}

      json_array["startPageNumber"] = @start_page_number unless @start_page_number.nil?
      json_array["pageCount"] = @page_count unless @page_count.nil?
      json_array["imageFormat"] = @image_format unless @image_format.nil?
      json_array["imageSize"] = @image_size unless @image_size.nil?
      JSON.pretty_generate(json_array)
    end
  end
end
