require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

include DynamicPDFApi

class PdfSecurityInfoSamplesTest < Minitest::Test


  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_Aes128PdfSecurityInfo
    @name = 'Aes128PdfSecurity'

    resource = PdfResource.new("#{INPUT_PATH}Aes128Security.pdf")

    pdf_info = PdfSecurityInfoEndpoint.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process
    File.open("#{OUTPUT_PATH}Aes128PdfSecurityInfo_JsonOutput.json", 'wb') { |file| file.write(response.json_content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_Aes256PdfSecurityInfo
    @name = 'Aes256PdfSecurity'

    resource = PdfResource.new("#{INPUT_PATH}Aes256Security.pdf")

    pdf_info = PdfSecurityInfoEndpoint.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Aes256PdfSecurityInfo_JsonOutput.json", 'wb') { |file| file.write(response.json_content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_Rc440PdfSecurityInfo
    @name = 'Rc440PdfSecurity'

    resource = PdfResource.new("#{INPUT_PATH}Rc440Security.pdf")

    pdf_info = PdfSecurityInfoEndpoint.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Rc440PdfSecurityInfo_JsonOutput.json", 'wb') { |file| file.write(response.json_content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_Rc4128PdfSecurityInfo
    @name = 'Rc4128PdfSecurity'

    resource = PdfResource.new("#{INPUT_PATH}Rc4128Security.pdf")

    pdf_info = PdfSecurityInfoEndpoint.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Rc4128PdfSecurityInfo_JsonOutput.json", 'wb') { |file| file.write(response.json_content) } if response.is_successful

    assert response.is_successful, response.error_message
  end
end
