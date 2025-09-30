require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

class TemplatePagenumberingSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_FilePathInputPNE_PdfOutput
    @name = 'FilePathInputPNE'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FilePathInputPNE_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FilePathInputPNE_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPNEsWithTokens_PdfOutput
    @name = 'FilePathPNEsWithTokens'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}Emptypages.pdf")
    emptypages = PdfInput.new(pdf_resource)

    template_a = Template.new('TemplateA')
    top_left_element = PageNumberingElement.new('%%CP(1)%% of %%TP%%', ElementPlacement::TOP_LEFT)
    template_a.elements << top_left_element

    top_center_element = PageNumberingElement.new('%%SP(I)%% of %%ST%%', ElementPlacement::TOP_CENTER)
    template_a.elements << top_center_element

    top_right_element = PageNumberingElement.new('%%CP(i)%% of %%TP%%', ElementPlacement::TOP_RIGHT)
    template_a.elements << top_right_element

    bottom_left_element = PageNumberingElement.new('%%CP(I)%% of %%TP%%', ElementPlacement::BOTTOM_LEFT)
    template_a.elements << bottom_left_element

    bottom_center_element = PageNumberingElement.new('%%CP(b)%% of %%TP%%', ElementPlacement::BOTTOM_CENTER)
    template_a.elements << bottom_center_element

    bottom_right_element = PageNumberingElement.new('%%CP(a)%% of %%TP%%', ElementPlacement::BOTTOM_RIGHT)
    template_a.elements << bottom_right_element

    emptypages.set_template(template_a)

    pdf.inputs << emptypages

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FilePathPNEsWithTokens_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FilePathPNEsWithTokens_JsonOutput.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end
end
