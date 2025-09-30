require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

class SecuritySamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PageInput_Aes256Security_PdfOutput
    @name = 'PageInputAes256Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    security = Aes256Security.new('user', 'owner')
    pdf.security = security

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputFilePathAes256Security_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputFilePathAes256Security_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_Aes128Security_PdfOutput
    @name = 'PageInputAes128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    pdf.security = security

    input = PageInput.new
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageInputAes128Security_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputAes128Security_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudRoot_RC4128Security_PdfOutput
    @name = 'PdfInputCloudRootRC4128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    pdf.security = security

    input = PdfInput.new('XmpAndOtherSample.pdf')
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputCloudRootRC4128Security_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputCloudRootRC4128Security_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
