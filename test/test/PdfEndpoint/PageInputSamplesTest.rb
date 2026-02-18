require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class PageInputSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PageInput_TextElement_Pdfoutput
    @Name = "TextElement"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE
    pdf.subject = "topLevel document metadata"
    pdf.creator = "John Creator";
    pdf.producer = "ceTe Software";
    pdf.keywords = "dynamicpdf api example pdf dotnet instructions";
    pdf.tag = true

    pageInput = PageInput.new
    element = TextElement.new("Hello World", ElementPlacement::TOP_CENTER)
    pageInput.elements << element

    pdf.inputs << pageInput
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TextElement_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TextElement_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageDimensions_Pdfoutput
    @Name = "TextElementWithPageDimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pageInput = pdf.add_page(PageSize::POSTCARD, PageOrientation::LANDSCAPE, 25)
    element = TextElement.new("Hello World", ElementPlacement::TOP_CENTER)
    pageInput.elements << element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageDimensions_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageDimensions_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_TextElementAddedToPageAndTemplate_Pdfoutput
    @Name = "TextElementAddedToPageAndTemplate"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pageInput = PageInput.new
    element = TextElement.new("Hello World1", ElementPlacement::TOP_LEFT)
    pageInput.elements << element

    template = Template.new("Temp1")
    element1 = TextElement.new("Hello World", ElementPlacement::TOP_CENTER)
    template.elements << element1

    pageInput.set_template(template)

    pdf.inputs << pageInput
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TextElementAddedToPageAndTemplate_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TextElementAddedToPageAndTemplate_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
