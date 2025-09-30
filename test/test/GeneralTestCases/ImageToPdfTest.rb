require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'


class ImageToPdfTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_ConvertTiffToPDF
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}fw9_13.tif")
    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageToPdf_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    assert response.is_successful, response.error_message
  end
end
