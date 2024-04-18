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
      File.open("#{OUTPUT_PATH}PageInputSamples1.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputSamples1.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}PageInputSamples2.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputSamples2.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_AddPage_Pdfoutput
    @Name = "PageInput_AddPage"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = pdf.add_page

    element = LineElement.new(200, 200, ElementPlacement::TOP_CENTER)
    element.line_style = LineStyle.dots

    input.elements << element
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageInputSamples3.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputSamples3.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_AddPageTemplate_Pdfoutput
    @Name = "PageInput_AddPageTemplate"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = pdf.add_page

    element = TextElement.new("test", ElementPlacement::TOP_CENTER)
    template = Template.new("temp")
    template.elements << element

    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageInputSamples4.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputSamples4.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_AddPageParameters_Pdfoutput
    @Name = "AddPageParameters"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = pdf.add_page(500, 500)

    element = TextElement.new("test", ElementPlacement::TOP_CENTER)
    input.elements << element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageInputSamples5.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputSamples5.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
