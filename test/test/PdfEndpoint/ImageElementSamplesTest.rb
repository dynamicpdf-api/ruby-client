require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

class ImageElementSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PdfInputUsingFilePath_WithTemplate_Pdfoutput
    @name = 'WithTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new('Temp1')
    resource1 = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    element = ImageElement.new(resource1, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElementSamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElementSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Templatescale_Pdfoutput
    @name = 'ScaleWithTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new('Temp1')
    resource1 = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    element = ImageElement.new(resource1, ElementPlacement::TOP_CENTER)
    element.scale_x = 3
    element.scale_y = 3
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElementSamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElementSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_TemplateWidth_Pdfoutput
    @name = 'WidthWithTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new('Temp1')
    resource1 = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    element = ImageElement.new(resource1, ElementPlacement::TOP_CENTER)
    element.max_height = 350
    element.max_width = 350
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElementSamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElementSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_TemplateWithXY_Pdfoutput
    @name = 'XYWithTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new('Temp1')
    resource1 = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    element = ImageElement.new(resource1, ElementPlacement::TOP_CENTER)
    element.x_offset = 50
    element.y_offset = 50
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElementSamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElementSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfPageInput_Template_Pdfoutput
    @name = 'PageTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    template = Template.new('Temp1')
    resource1 = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    element = ImageElement.new(resource1, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElementSamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElementSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfPageInput_Page_Pdfoutput
    @name = 'PageElement'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    resource1 = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    element = ImageElement.new(resource1, ElementPlacement::TOP_CENTER)
    input.elements << element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElementSamples6.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElementSamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingStream_Template_Pdfoutput
    @name = 'StreamTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}DocumentA100.pdf", 'rb')
    pdf_resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(pdf_resource)
    pdf.inputs << input

    template = Template.new('Temp1')

    file = File.open("#{INPUT_PATH}Northwind Logo.gif", 'rb')
    resource1 = ImageResource.new(file)
    file.close

    element = ImageElement.new(resource1, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElementSamples7.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElementSamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingBytes_Template_Pdfoutput
    @name = 'BytesTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(pdf_resource)
    pdf.inputs << input

    template = Template.new('Temp1')
    resource1 = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    element = ImageElement.new(resource1, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElementSamples8.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElementSamples8.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudRoot_Template_Pdfoutput
    @name = 'CloudRootTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('DocumentA100.pdf')
    pdf.inputs << input

    template = Template.new('Temp1')
    element = ImageElement.new('Northwind Logo.gif', ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageElementSamples9.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageElementSamples9.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
