require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

include DynamicPDFApi

class TemplateSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_FilePathInputTextElement_Pdfoutput
    @name = 'FilePathInputTextElement'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input

    template = Template.new('Temp1')
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateSamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamInputTextElement_Pdfoutput
    @name = 'StreamInputTextElement'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}DocumentA100.pdf", 'rb')
    resource = PdfResource.new(file)
    file.close
    input = PdfInput.new(resource)

    pdf.inputs << input

    template = Template.new('Temp1')
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateSamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesTextElement_Pdfoutput
    @name = 'BytesInputTextElement'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')

    resource = PdfResource.new(file.read.unpack('C*'))
    input = PdfInput.new(resource)

    pdf.inputs << input

    template = Template.new('Temp1')
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateSamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootTextElement_Pdfoutput
    @name = 'CloudRootInputTextElement'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('DocumentA100.pdf')

    pdf.inputs << input

    template = Template.new('Temp1')
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateSamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderTextElement_Pdfoutput
    @name = 'CloudSubFolderInputTextElement'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('Resources/DocumentA100.pdf')

    pdf.inputs << input

    template = Template.new('Temp1')
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateSamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
