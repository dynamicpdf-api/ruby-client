require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class ExcelInputSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_ExcelFile_pdfoutput
    @name = "ExcelToPdf"
    pdf = Pdf.new()
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    excelResource = ExcelResource.new("#{INPUT_PATH}DocumentA.xlsx")
    excel = ExcelInput.new(excelResource)

    excel.page_width = 300
    excel.page_height = 200

    excel.top_margin = 10
    excel.bottom_margin = 10
    excel.right_margin = 40
    excel.left_margin = 40

    pdf.inputs.push(excel)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ExcelInputSamples1.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ExcelInputSamples1.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
