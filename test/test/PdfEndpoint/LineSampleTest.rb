require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class LineSampleTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PageInput_Pdfoutput
    @name = "PageInput"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    element = LineElement.new(20, 20, ElementPlacement::BOTTOM_RIGHT)
    input.elements << element

    response = pdf.process

    File.open("#{OUTPUT_PATH}LineSample1.pdf", "wb") { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}LineSample1.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputLineStyle_Pdfoutput
    @name = "PageInputLineStyle"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    element = LineElement.new(200, 200, ElementPlacement::TOP_CENTER)
    element.line_style = LineStyle.new([2, 4, 2], 0.5)
    input.elements << element

    response = pdf.process

    File.open("#{OUTPUT_PATH}LineSample2.pdf", "wb") { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}LineSample2.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputXy_offset_Pdfoutput
    @name = "PageInputWithXy_offset"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    element = LineElement.new(200, 200, ElementPlacement::TOP_CENTER)
    element.x_offset = 100
    element.y_offset = 100
    element.line_style = LineStyle.dash
    input.elements << element

    response = pdf.process

    File.open("#{OUTPUT_PATH}LineSample3.pdf", "wb") { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}LineSample3.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputColor_Pdfoutput
    @name = "PageInputWithColor"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    element = LineElement.new(200, 200, ElementPlacement::TOP_CENTER)
    element.color = RgbColor.red
    element.line_style = LineStyle.dots
    input.elements << element

    response = pdf.process

    File.open("#{OUTPUT_PATH}LineSample4.pdf", "wb") { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}LineSample4.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputProperties_Pdfoutput
    @name = "PageInputWithProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    element = LineElement.new(200, 200, ElementPlacement::TOP_LEFT)
    element.color = RgbColor.new(0, 0, 1)
    element.x_offset = 100
    element.y_offset = 100
    element.line_style = LineStyle.dash_large
    element.width = 4
    input.elements << element

    response = pdf.process

    File.open("#{OUTPUT_PATH}LineSample5.pdf", "wb") { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}LineSample5.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfPageInputPropertiesWithTemplate_Pdfoutput
    @name = "PageInputPropertiesWithTemplate"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    template = Template.new("temp")
    element = LineElement.new(200, 200, ElementPlacement::TOP_LEFT)
    element.color = RgbColor.new(0, 0, 1)
    element.x_offset = 100
    element.y_offset = 100
    element.line_style = LineStyle.dash_large
    element.width = 4
    template.elements << element
    input.set_template(template)

    response = pdf.process

    File.open("#{OUTPUT_PATH}LineSample6.pdf", "wb") { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}LineSample6.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Template_Pdfoutput
    @name = "PdfInputPropertiesWithTemplate"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input

    template = Template.new("temp")
    element = LineElement.new(200, 200, ElementPlacement::TOP_LEFT)
    element.color = RgbColor.new(0, 0, 1)
    element.x_offset = 100
    element.y_offset = 100
    element.line_style = LineStyle.dash_large
    element.width = 4
    template.elements << element
    input.set_template(template)

    response = pdf.process

    File.open("#{OUTPUT_PATH}LineSample7.pdf", "wb") { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}LineSample7.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingStream_Template_Pdfoutput
    @name = "PdfInputStreamPropertiesWithTemplate"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}DocumentA100.pdf", "rb")
    resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(resource)

    pdf.inputs << input

    template = Template.new("temp")
    element = LineElement.new(200, 200, ElementPlacement::TOP_LEFT)
    element.color = RgbColor.new(0, 0, 1)
    element.x_offset = 100
    element.y_offset = 100
    element.line_style = LineStyle.dash_large
    element.width = 4
    template.elements << element
    input.set_template(template)

    response = pdf.process

    File.open("#{OUTPUT_PATH}LineSample8.pdf", "wb") { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}LineSample8.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
