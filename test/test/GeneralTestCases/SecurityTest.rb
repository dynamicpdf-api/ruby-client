require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'


class SecurityTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_EncryptPDF
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    text_element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    page_input.elements << text_element

    image_resource = ImageResource.new("#{INPUT_PATH}DPDFLogo.png")
    image = ImageElement.new(image_resource, ElementPlacement::TOP_CENTER, 0, 275)
    page_input.elements << image

    pdf.inputs << page_input

    security = Aes256Security.new('OwnerPassword', 'UserPassword')
    security.allow_accessibility = true

    pdf.security = security

    response = pdf.process

    File.open("#{OUTPUT_PATH}SecurityTest1.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_EncryptExistingPDF
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    document_aresource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    document_ainput = PdfInput.new(document_aresource)
    pdf.inputs << document_ainput

    security = Aes256Security.new('OwnerPassword', 'UserPassword')
    security.allow_copy = false
    security.allow_print = false

    pdf.security = security

    response = pdf.process

    File.open("#{OUTPUT_PATH}SecurityTest2.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end
end
