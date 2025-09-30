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
      File.open("#{OUTPUT_PATH}TextExtraction_JsonOutput.json", 'wb') { |file| file.write(response.json_content) }
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
      File.open("#{OUTPUT_PATH}SinglePage_JsonOutput.json", 'wb') { |file| file.write(response.content) }
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
      File.open("#{OUTPUT_PATH}MultiPage_JsonOutput.json", 'wb') { |file| file.write(response.content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_TextExtractionStream
    @name = 'Stream'

    resource = PdfResource.new("#{INPUT_PATH}HARDWARE_SPEC_2025-04-23a.pdf")
    text = PdfText.new(resource)
    text.api_key = KEY
    text.base_url = URL

    text.start_page = 2
    text.page_count = 1
    text.text_order = TextOrder::STREAM

    response = text.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}Stream_JsonOutput.json", 'wb') { |file| file.write(response.content[0]["text"])}
    end

    assert response.is_successful, response.error_message
  end

  def test_TextExtractionVisible
    @name = 'Visible'

    resource = PdfResource.new("#{INPUT_PATH}HARDWARE_SPEC_2025-04-23a.pdf")
    text = PdfText.new(resource)
    text.api_key = KEY
    text.base_url = URL

    text.start_page = 2
    text.page_count = 1
    text.text_order = TextOrder::VISIBLE

    response = text.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}Visible_JsonOutput.json", 'wb') { |file| file.write(response.content[0]["text"])}
    end

    assert response.is_successful, response.error_message
  end

  def test_TextExtractionVisibleExtraSpace
    @name = 'VisibleExtraSpace'

    resource = PdfResource.new("#{INPUT_PATH}HARDWARE_SPEC_2025-04-23a.pdf")
    text = PdfText.new(resource)
    text.api_key = KEY
    text.base_url = URL

    text.start_page = 2
    text.page_count = 1
    text.text_order = TextOrder::VISIBLE_EXTRA_SPACE

    response = text.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}VisibleExtraSpace_JsonOutput.json", 'wb') { |file| file.write(response.content[0]["text"])}
    end

    assert response.is_successful, response.error_message
  end

end
