require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'


class MergeTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_MergePdfs
    @name = 'MergePdfs'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    document_aresource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    document_ainput = PdfInput.new(document_aresource)
    pdf.inputs << document_ainput

    document_bresource = PdfResource.new("#{INPUT_PATH}DocumentB.pdf")
    document_binput = PdfInput.new(document_bresource)
    pdf.inputs << document_binput

    document_cresource = PdfResource.new("#{INPUT_PATH}DocumentC.pdf")
    document_cinput = PdfInput.new(document_cresource)
    pdf.inputs << document_cinput

    response = pdf.process

    File.open("#{OUTPUT_PATH}MergeTest_PdfOutput.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end
end
