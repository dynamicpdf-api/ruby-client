require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

include DynamicPDFApi

class FontSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PageInput_CoreFont_Pdfoutput
    @name = 'CoreFont'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(Font.times_bold_italic)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}CoreFont_Pdfoutput.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}CoreFont_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_TtfFont_Pdfoutput
    @name = 'TtfFont'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.from_file("#{INPUT_PATH}arialbi.ttf")

    page_input = PageInput.new

    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}TtfFont_Pdfoutput.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}TtfFont_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_CloudFont_Pdfoutput
    @name = 'CloudFont'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.new('Calibri.otf')

    page_input = PageInput.new

    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}CloudFont_Pdfoutput.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}CloudFont_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_GoogleFont_Pdfoutput
    @name = 'GoogleFont'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.google("Roboto", 300, false)
    font.embed = true
    font.subset = true

    page_input = PageInput.new
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}GoogleFont_Pdfoutput.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}GoogleFont_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_GlobalFont_Pdfoutput
    @name = 'GlobalFont'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.global("Paris Normal")
    font.embed = true
    font.subset = true

    page_input = PageInput.new
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}GlobalFont_Pdfoutput.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}GlobalFont_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_SystemFont_Pdfoutput
    @name = 'SystemFont'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    element = TextElement.new('Monotype Corsiva', ElementPlacement::TOP_CENTER)
    font = Font.from_system("Monotype Corsiva")
    element.font(font)
    element.font_size=50
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}SystemFont_Pdfoutput.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}SystemFont_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
