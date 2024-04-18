require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'


class FormFillTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_AcroFormFilling
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    pdf.form_fields << field
    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    pdf.form_fields << field1
    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    pdf.form_fields << field2
    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    pdf.form_fields << field3
    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    pdf.form_fields << field4
    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    pdf.form_fields << field5
    field6 = FormField.new('topmostSubform[0].Page1[0].f1_10[0]', '17288825617')
    pdf.form_fields << field6
    field7 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]', '52')
    pdf.form_fields << field7
    field8 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]', '1234567')
    pdf.form_fields << field8

    response = pdf.process

    File.open("#{OUTPUT_PATH}FormFillTest1.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end
end
