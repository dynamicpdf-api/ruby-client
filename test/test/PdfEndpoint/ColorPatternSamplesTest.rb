require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

class ColorPatternSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PdfPageInput_NamedColorSample_PdfOutput
    @name = 'NamedColor'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    template = Template.new('Temp1')
    text_element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    text_element.color = RgbColor.red
    template.elements << text_element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}NamedColor_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}NamedColor_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfPageInput_RGBColorSample_PdfOutput
    @name = 'RGBColor'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    text_element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    text_element.color = RgbColor.new(0, 1, 0)
    input.elements << text_element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RGBColor_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RGBColor_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfPageInput_CMYKColorSample_PdfOutput
    @name = 'CMYKColor'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    text_element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    text_element.color = CmykColor.new(0, 1, 0, 0)
    input.elements << text_element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}CMYKColor_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}CMYKColor_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfPageInput_GrayScaleColorSample_PdfOutput
    @name = 'GrayScale'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    text_element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    text_element.color = Grayscale.new(0.8)
    input.elements << text_element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}GrayScale_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}GrayScale_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
