require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

class RectangleSamplesTest < Minitest::Test
  include DynamicPDFApi

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

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples1.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples1.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputPlacement_Pdfoutput
    @name = "PageInputPlacement"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    element.placement = ElementPlacement::BOTTOM_RIGHT
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples2.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples2.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputXy_offset_Pdfoutput
    @name = "PageInputXy_offset"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_LEFT)
    element.x_offset = 50
    element.y_offset = 50
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples3.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples3.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputCornerRadius_Pdfoutput
    @name = "PageInputCornerRadius"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    element.corner_radius = 10
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples4.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples4.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputtBorderWidth_Pdfoutput
    @name = "PageInputtBorderWidth"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    element.border_width = 5
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples5.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples5.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputBorderStyle_Pdfoutput
    @name = "PageInputBorderStyle"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    element.border_style = LineStyle.dots
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples6.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples6.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputBorderStyleArray_Pdfoutput
    @name = "PageInputBorderStyleArray"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    element.border_style = LineStyle.new([2, 1, 4, 2])
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples7.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples7.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputBorderColor_Pdfoutput
    @name = "PageInputBorderColor"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    element.border_color = RgbColor.blue
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples8.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples8.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputFillColor_Pdfoutput
    @name = "PageInputFillColor"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    element.fill_color = RgbColor.green
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples9.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples9.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePath_PdfOutput
    @name = "FilePath"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input
    template = Template.new("Temp1")

    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples10.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples10.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_Bytes_PdfOutput
    @name = "FilePath"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input
    template = Template.new("Temp1")

    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples11.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples11.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_Stream_PdfOutput
    @name = "Stream"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", "rb")
    resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(resource)
    pdf.inputs << input
    template = Template.new("Temp1")

    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples12.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples12.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRoot_PdfOutput
    @name = "CloudRoot"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")
    pdf.inputs << input
    template = Template.new("Temp1")

    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples13.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples13.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolder_PdfOutput
    @name = "CloudSubFolder"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")
    pdf.inputs << input
    template = Template.new("Temp1")

    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples14.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples14.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathEvenOddTemplate_PdfOutput
    @name = "FilePathEvenOddTemplateEven"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")
    element = RectangleElement.new(100, 50, ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}RectangleSamples15.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}RectangleSamples15.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
