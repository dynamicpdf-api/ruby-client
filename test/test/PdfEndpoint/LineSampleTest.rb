require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class LineSampleTest < Minitest::Test
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

    input = PageInput.new
    pdf.inputs << input

    element = LineElement.new(20, 20, ElementPlacement::BOTTOM_RIGHT)
    input.elements << element

    response = pdf.process

    File.open("#{OUTPUT_PATH}LineElement_PdfOutput.pdf", "wb") { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}LineElement_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

end
