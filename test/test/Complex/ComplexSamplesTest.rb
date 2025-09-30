require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

class ComplexSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  # #TEST#
  def test_Inputs_DifferentInputs_PdfOutput
    @name = "MultipleInputs"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_input = PdfInput.new("DocumentA100.pdf")
    merge_options = MergeOptions.new
    pdf_input.merge_options = merge_options
    pdf.inputs << pdf_input

    page_input = PageInput.new
    text_element = TextElement.new("Hello World", ElementPlacement::TOP_LEFT)
    text_element.font_size = 40
    page_input.elements << text_element
    pdf.inputs << page_input

    page_input = PageInput.new
    img = ImageResource.new("#{INPUT_PATH}DocumentA.jpeg", "DocumentA.jpeg")
    image_element=ImageElement.new(img,ElementPlacement::TOP_CENTER)
    image_element.x_offset=50
    image_element.y_offset=50
    page_input.elements<<image_element
    pdf.inputs<<page_input

    dlex_input = DlexInput.new("SimpleReportWithCoverPage.dlex", "SimpleReportData.json")
    pdf.inputs << dlex_input

    image_input = ImageInput.new("Image1.jpg")
    image_input.top_margin = 10
    image_input.left_margin = 10
    image_input.right_margin = 10
    image_input.bottom_margin = 10
    pdf.inputs << image_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}MultipleInputs_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}MultipleInputs_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
