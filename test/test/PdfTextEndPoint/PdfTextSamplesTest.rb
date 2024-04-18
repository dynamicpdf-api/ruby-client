require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'


class PdfTextSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_TextExtraction
    @name = 'TextExtraction'

    resource = PdfResource.new("#{INPUT_PATH}Test_Textmarker_Serienbrief(2).pdf")

    text = PdfText.new(resource)
    text.api_key = KEY
    text.base_url = URL

    response = text.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfTextSamples1.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_TextExtractionWithSinglePage
    @name = 'SinglePage'

    resource = PdfResource.new("#{INPUT_PATH}Test_Textmarker_Serienbrief(2).pdf")

    text = PdfText.new(resource)
    text.api_key = KEY
    text.base_url = URL

    text.start_page = 5
    text.page_count = 1
    response = text.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfTextSamples2.json", 'wb') { |file| file.write(response.content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_TextExtractionWithMultipage
    @name = 'MultiPage'

    resource = PdfResource.new("#{INPUT_PATH}Test_Textmarker_Serienbrief(2).pdf")
    text = PdfText.new(resource)
    text.api_key = KEY
    text.base_url = URL

    text.start_page = 2
    text.page_count = 3

    response = text.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfTextSamples3.json", 'wb') { |file| file.write(response.content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_TextExtractionCJKFonts
    @name = 'CJKFonts'

    resource = PdfResource.new("#{INPUT_PATH}pdf_font-zhcn.pdf")

    text = PdfText.new(resource)
    text.api_key = KEY
    text.base_url = URL

    response = text.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfTextSamples4.json", 'wb') { |file| file.write(response.content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_TextExtractionSpecialChars
    @name = 'SpecialChars'

    resource = PdfResource.new("#{INPUT_PATH}Input.pdf")

    text = PdfText.new(resource)
    text.api_key = KEY
    text.base_url = URL

    response = text.process
    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfTextSamples5.json", 'wb') { |file| file.write(response.content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_TextExtractionArabic
    @name = 'Arabic'

    resource = PdfResource.new("#{INPUT_PATH}Arabic.pdf")

    text = PdfText.new(resource)
    text.api_key = KEY
    text.base_url = URL

    response = text.process
    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfTextSamples6.json", 'wb') { |file| file.write(response.content) }
    end

    assert response.is_successful, response.error_message
  end
end
