require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

class ImageElementSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE


  def test_PdfPageInput_Page_Pdfoutput
    @name = 'PageElement'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    resource1 = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    element = ImageElement.new(resource1, ElementPlacement::TOP_CENTER)
    input.elements << element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElement_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElement_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

end
