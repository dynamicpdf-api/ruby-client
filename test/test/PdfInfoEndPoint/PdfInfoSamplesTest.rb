require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'


class PdfInfoSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_AllFormFields_JsonOutput
    @name = 'AllFormFields'

    resource = PdfResource.new("#{INPUT_PATH}AllFormFields.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}AllFormFields_JsonOutput.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end
end
