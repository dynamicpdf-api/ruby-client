require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

class RectangleSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PageInput_Pdfoutput
    @name = "PageInput"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleElement_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleElement_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
