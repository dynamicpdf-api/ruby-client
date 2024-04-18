module DynamicPDFApi
  #
  # Represents the pdf information.
  #
  class PdfInformation
    def initialize
      @author = nil
      @subject = nil
      @keywords = nil
      @creator = nil
      @producer = nil
      @title = nil
      @pages = {}
      @form_fields = nil
      @custom_properties = nil
      @xmp_meta_data = nil
      @signed = nil
      @tagged = nil
    end

    #
    # Gets the author.
    #
    attr_accessor :author

    #
    # Gets the subject.
    #
    attr_accessor :subject

    #
    # Gets the keywords.
    #
    attr_accessor :keywords

    #
    # Gets the creator.
    #
    attr_accessor :creator

    #
    # Gets the producer.
    #
    attr_accessor :producer

    #
    # Gets the title.
    #
    attr_accessor :title

    #
    # Gets the collection of PageInformation.
    #
    attr_accessor :pages

    #
    # Gets the form fields.
    #
    attr_accessor :form_fields

    #
    # Gets the custom properties.
    #
    attr_accessor :custom_properties

    #
    # Gets the boolean representing xmp meta data.
    #
    attr_accessor :xmp_meta_data

    #
    # Gets the boolean, indicating whether the pdf is signed.
    #
    attr_accessor :signed

    #
    # Gets the boolean, indicating whether the pdf is tagged.
    #
    attr_accessor :tagged
  end
end
