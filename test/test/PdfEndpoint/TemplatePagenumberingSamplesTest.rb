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
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamInputPNE_PdfOutput
    @name = 'StreamInputPNE'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')
    pdf_resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(pdf_resource)

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesInputPNE_PdfOutput
    @name = 'BytesInputPNE'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')

    pdf_resource = PdfResource.new(file.read.unpack('C*'))
    input = PdfInput.new(pdf_resource)

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootInputPNE_PdfOutput
    @name = 'CloudRootInputPNE'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('DocumentA100.pdf')

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderInputPNE_PdfOutput
    @name = 'CloudSubFolderInputPNE'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('Resources/DocumentA100.pdf')

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathInputPNEWithProperties_PdfOutput
    @name = 'FilePathInputPNEWithProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(pdf_resource)

    font_resource = Font.from_file("#{INPUT_PATH}ARIALNB.TTF", 'arialfont')

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER, 50, 50)
    element.font(font_resource)
    element.font_size = 14.0

    element.color = RgbColor.red
    template_a.elements << element

    input.set_template(template_a)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples6.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathInputPNEs_PdfOutput
    @name = 'FilePathInputPNEs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    fw9_acro_form_18_resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_18.pdf")
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    top_element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << top_element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_CENTER)
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples7.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamInputPNEs_PdfOutput
    @name = 'StreamInputPNEs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}Invoice.pdf", 'rb')
    invoice_resource = PdfResource.new(file)
    file.close

    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    file2 = File.open("#{INPUT_PATH}fw9AcroForm_18.pdf", 'rb')
    fw9_acro_form_18_resource = PdfResource.new(file2)
    file2.close

    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    file3 = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')
    document_a100_resource = PdfResource.new(file3)
    file3.close

    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    top_element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << top_element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_CENTER)
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples8.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples8.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesInputPNEs_PdfOutput
    @name = 'BytesInputPNEs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}Invoice.pdf", 'rb')

    invoice_resource = PdfResource.new(file.read.unpack('C*'))
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    file = File.open("#{INPUT_PATH}fw9AcroForm_18.pdf", 'rb')

    fw9_acro_form_18_resource = PdfResource.new(file.read.unpack('C*'))
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')

    document_a100_resource = PdfResource.new(file.read.unpack('C*'))
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    top_element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << top_element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_CENTER)
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples9.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples9.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootInputPNEs_PdfOutput
    @name = 'CloudRootInputPNEs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice = PdfInput.new('Invoice.pdf')
    pdf.inputs << invoice

    fw9_acro_form_18 = PdfInput.new('fw9AcroForm_18.pdf')
    pdf.inputs << fw9_acro_form_18

    document_a100 = PdfInput.new('DocumentA100.pdf')
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    top_element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << top_element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_CENTER)
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples10.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples10.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderInputPNEs_PdfOutput
    @name = 'CloudSubFolderInputPNEs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice = PdfInput.new('Resources/Invoice.pdf')
    pdf.inputs << invoice

    fw9_acro_form_18 = PdfInput.new('Resources/fw9AcroForm_18.pdf')
    pdf.inputs << fw9_acro_form_18

    document_a100 = PdfInput.new('Resources/DocumentA100.pdf')
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    top_element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << top_element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_CENTER)
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples11.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples11.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_FilePathPNEWithProperties_PdfOutput
    @name = 'FilePathPNEWithProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    fw9_acro_form_18_resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_18.pdf")
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    font_resource = Font.from_file("#{INPUT_PATH}ARIALNB.TTF", 'arialfont')

    template_a = Template.new('TemplateA')
    top_element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER, 50, 50)
    top_element.font(font_resource)
    top_element.font_size = 14.0
    top_element.color = RgbColor.red
    template_a.elements << top_element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_CENTER, 50, -50)
    bottom_element.font_size = 14.0
    bottom_element.color = RgbColor.red
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples12.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples12.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

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
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples13.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples13.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_FilePath_PNEsWithTokensAndProperties_PdfOutput
    @name = 'FilePath_PNEsWithTokensAndProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}Emptypages.pdf")
    emptypages = PdfInput.new(pdf_resource)
    pdf.inputs << emptypages

    font_resource = Font.from_file("#{INPUT_PATH}ARIALNB.TTF", 'arialfont')

    template_a = Template.new('TemplateA')
    top_left_element = PageNumberingElement.new('%%CP(1)%% of %%TP%%', ElementPlacement::TOP_LEFT, 50, 50)
    top_left_element.font(font_resource)
    top_left_element.font_size = 14.0
    template_a.elements << top_left_element

    top_center_element = PageNumberingElement.new('%%SP(I)%% of %%ST%%', ElementPlacement::TOP_CENTER, 50, 50)
    top_center_element.font(font_resource)
    top_center_element.font_size = 14.0
    template_a.elements << top_center_element

    top_right_element = PageNumberingElement.new('%%CP(i)%% of %%TP%%', ElementPlacement::TOP_RIGHT, -50, 50)
    top_right_element.font(font_resource)
    top_right_element.font_size = 14.0
    template_a.elements << top_right_element

    bottom_left_element = PageNumberingElement.new('%%CP(I)%% of %%TP%%', ElementPlacement::BOTTOM_LEFT, 50, -50)
    bottom_left_element.font(font_resource)
    bottom_left_element.font_size = 14.0
    template_a.elements << bottom_left_element

    bottom_center_element = PageNumberingElement.new('%%CP(b)%% of %%TP%%', ElementPlacement::BOTTOM_CENTER, 50, -50)
    bottom_center_element.font(font_resource)
    bottom_center_element.font_size = 14.0
    template_a.elements << bottom_center_element

    bottom_right_element = PageNumberingElement.new('%%CP(a)%% of %%TP%%', ElementPlacement::BOTTOM_RIGHT, -50, -50)
    bottom_right_element.font(font_resource)
    bottom_right_element.font_size = 14.0
    template_a.elements << bottom_right_element

    emptypages.set_template(template_a)
    pdf.inputs << emptypages

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples14.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples14.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_FilePath_PNEsWithTokens_PdfOutput
    @name = 'FilePath_PNEsWithTokens'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    fw9_acro_form_18_resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_18.pdf")
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

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

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_CENTER)
    template_b.elements << bottom_element
    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples15.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples15.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_FilePathPNEsWithTokensAndProperties_PdfOutput
    @name = 'FilePathPNEsWithTokensAndProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    fw9_acro_form_18_resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_18.pdf")
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    font_resource = Font.from_file("#{INPUT_PATH}ARIALNB.TTF", 'arialfont')

    template_a = Template.new('TemplateA')
    top_left_element = PageNumberingElement.new('%%CP(1)%% of %%TP%%', ElementPlacement::TOP_LEFT, 50, 50)
    top_left_element.font(font_resource)
    top_left_element.font_size = 14.0
    template_a.elements << top_left_element

    top_center_element = PageNumberingElement.new('%%SP(I)%% of %%ST%%', ElementPlacement::TOP_CENTER, 50, 50)
    top_center_element.font(font_resource)
    top_center_element.font_size = 14.0
    template_a.elements << top_center_element

    top_right_element = PageNumberingElement.new('%%CP(i)%% of %%TP%%', ElementPlacement::TOP_RIGHT, -50, 50)
    top_right_element.font(font_resource)
    top_right_element.font_size = 14.0
    template_a.elements << top_right_element

    bottom_left_element = PageNumberingElement.new('%%CP(I)%% of %%TP%%', ElementPlacement::BOTTOM_LEFT, 50, -50)
    bottom_left_element.font(font_resource)
    bottom_left_element.font_size = 14.0
    template_a.elements << bottom_left_element

    bottom_center_element = PageNumberingElement.new('%%CP(b)%% of %%TP%%', ElementPlacement::BOTTOM_CENTER, 50, -50)
    bottom_center_element.font(font_resource)
    bottom_center_element.font_size = 14.0
    template_a.elements << bottom_center_element

    bottom_right_element = PageNumberingElement.new('%%CP(a)%% of %%TP%%', ElementPlacement::BOTTOM_RIGHT, -50, -50)
    bottom_right_element.font(font_resource)
    bottom_right_element.font_size = 14.0
    template_a.elements << bottom_right_element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_CENTER, 50, -50)
    bottom_element.font(font_resource)
    bottom_element.font_size = 14.0
    bottom_element.color = RgbColor.blue
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples16.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples16.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_FilePath_PNEWithMultilineAndProperties_PdfOutput
    @name = 'FilePath_PNEWithMultilineAndProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(pdf_resource)
    pdf.inputs << input

    font_resource = Font.from_file("#{INPUT_PATH}ARIALNB.TTF", 'arialfont')

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% \r\nof %%TP%%', ElementPlacement::TOP_CENTER, 50, 50)
    element.font(font_resource)
    element.font_size = 14.0
    template_a.elements << element

    input.set_template(template_a)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples17.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples17.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_FilePathPNEAddedToEvenPages_PdfOutput
    @name = 'FilePathPNEAddedToEvenPages'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(pdf_resource)

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples18.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples18.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_Stream_PNEAddedToEvenPages_PdfOutput
    @name = 'Stream_PNEAddedToEvenPages'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')
    pdf_resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(pdf_resource)

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples19.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples19.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_Bytes_PNEAddedToEvenPages_PdfOutput
    @name = 'Bytes_PNEAddedToEvenPages'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')

    pdf_resource = PdfResource.new(file.read.unpack('C*'))
    input = PdfInput.new(pdf_resource)

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples20.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples20.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_CloudRootPNEAddedToEvenPages_PdfOutput
    @name = 'CloudRootPNEAddedToEvenPages'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('DocumentA100.pdf')

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples21.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples21.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderPNEAddedToEO_PdfOutput
    @name = 'CloudSubFolderPNEAddedToEO'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('Resources/DocumentA100.pdf')

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples22.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples22.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_FilePathPNEWithPropertiesAddedToEO_PdfOutput
    @name = 'FilePathPNEWithPropertiesAddedToEO'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(pdf_resource)

    font_resource = Font.from_file("#{INPUT_PATH}ARIALNB.TTF", 'arialfont')

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER, 50, 50)
    element.font(font_resource)
    element.font_size = 14.0
    element.even_pages = true
    element.color = RgbColor.red
    template_a.elements << element
    input.set_template(template_a)

    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples23.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples23.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_FilePathPNEAddedToEO_PdfOutput
    @name = 'FilePathPNEAddedToEO'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    fw9_acro_form_18_resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_18.pdf")
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_RIGHT)
    element.even_pages = true
    template_a.elements << element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_LEFT)
    bottom_element.odd_pages = true
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples24.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples24.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_StreamInputPNEAddedToEO_PdfOutput
    @name = 'StreamInputPNEAddedToEO'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}Invoice.pdf", 'rb')
    invoice_resource = PdfResource.new(file)
    file.close

    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    file2 = File.open("#{INPUT_PATH}fw9AcroForm_18.pdf", 'rb')
    fw9_acro_form_18_resource = PdfResource.new(file2)
    file2.close

    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    file3 = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')
    document_a100_resource = PdfResource.new(file3)
    file3.close

    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_RIGHT)
    element.even_pages = true
    template_a.elements << element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_LEFT)
    bottom_element.odd_pages = true
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples25.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples25.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_BytesInputPNEAddedToEO_PdfOutput
    @name = 'BytesInputPNEAddedToEO'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}Invoice.pdf", 'rb')

    invoice_resource = PdfResource.new(file.read.unpack('C*'))
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    file = File.open("#{INPUT_PATH}fw9AcroForm_18.pdf", 'rb')

    fw9_acro_form_18_resource = PdfResource.new(file.read.unpack('C*'))
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')

    document_a100_resource = PdfResource.new(file.read.unpack('C*'))
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_RIGHT)
    element.even_pages = true
    template_a.elements << element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_LEFT)
    bottom_element.odd_pages = true
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples26.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples26.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_CloudRootPNEAddedToEO_PdfOutput
    @name = 'CloudRootPNEAddedToEO'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice = PdfInput.new('Invoice.pdf')
    pdf.inputs << invoice

    fw9_acro_form_18 = PdfInput.new('fw9AcroForm_18.pdf')
    pdf.inputs << fw9_acro_form_18

    document_a100 = PdfInput.new('DocumentA100.pdf')
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_RIGHT)
    element.even_pages = true
    template_a.elements << element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_LEFT)
    bottom_element.odd_pages = true
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples27.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples27.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_ColudSubFolderPNEAddedToEO_PdfOutput
    @name = 'ColudSubFolderPNEAddedToEO'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice = PdfInput.new('Resources/Invoice.pdf')
    pdf.inputs << invoice

    fw9_acro_form_18 = PdfInput.new('Resources/fw9AcroForm_18.pdf')
    pdf.inputs << fw9_acro_form_18

    document_a100 = PdfInput.new('Resources/DocumentA100.pdf')
    pdf.inputs << document_a100

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_RIGHT)
    element.even_pages = true
    template_a.elements << element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_LEFT)
    bottom_element.odd_pages = true
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples28.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples28.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_FilePathPNEWithPropertiesEO_PdfOutput
    @name = 'FilePathPNEWithPropertiesEO'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    fw9_acro_form_18_resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_18.pdf")
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    font_resource = Font.from_file("#{INPUT_PATH}ARIALNB.TTF", 'arialfont')

    template_a = Template.new('TemplateA')
    element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_RIGHT, -50, 50)
    element.font(font_resource)
    element.font_size = 14.0
    element.even_pages = true
    element.color = RgbColor.red
    template_a.elements << element

    invoice.set_template(template_a)
    document_a100.set_template(template_a)

    template_b = Template.new('TemplateB')
    bottom_element = PageNumberingElement.new('%%CP%%', ElementPlacement::BOTTOM_LEFT, 50, -50)
    bottom_element.font(font_resource)
    bottom_element.font_size = 14.0
    bottom_element.odd_pages = true
    bottom_element.color = RgbColor.blue
    template_b.elements << bottom_element

    fw9_acro_form_18.set_template(template_b)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples29.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples29.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_PageInputTextAndImageAndPNEWithProperties_PdfOutput
    @name = 'PageInputTextAndImageAndPNEWithProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    # Add Blank Page
    pageInput = PageInput.new

    # Add element into the page
    element = TextElement.new('Hello World1', ElementPlacement::TOP_LEFT)
    element.color = RgbColor.red
    pageInput.elements << element

    # Create template and add text element
    template = Template.new('Temp1')
    element1 = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.color = RgbColor.blue
    template.elements << element1

    pageInput.set_template(template)

    pdf.inputs << pageInput

    # Add Pdfinput
    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice_pdf_input = PdfInput.new(invoice_resource)
    pdf.inputs << invoice_pdf_input

    # Create template and add pagenumbering element
    template_a = Template.new('TemplateA')
    page_numbering_element = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::TOP_CENTER)
    template_a.elements << page_numbering_element

    invoice_pdf_input.set_template(template_a)

    # Add pdfinput
    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100PdfInput = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100PdfInput

    # create EvenAddTemplate with pagenumbering label
    template_b = Template.new('TemplateB')
    page_numbering_element1 = PageNumberingElement.new('%%CP%%', ElementPlacement::TOP_CENTER)
    page_numbering_element1.odd_pages = true
    template_b.elements << page_numbering_element1

    document_a100PdfInput.set_template(template_b)

    # Add pdfinput

    single_page_resource = PdfResource.new("#{INPUT_PATH}SinglePage.pdf")
    single_page_pdf_input = PdfInput.new(single_page_resource)
    pdf.inputs << single_page_pdf_input

    fw9AcroForm_14Resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    fw9AcroForm_14PdfInput = PdfInput.new(fw9AcroForm_14Resource)
    pdf.inputs << fw9AcroForm_14PdfInput

    # Add Blank Page
    page_input1 = PageInput.new

    # Add element into the page
    element2 = TextElement.new('Hello World1', ElementPlacement::TOP_LEFT)
    page_input1.elements << element2

    pdf.inputs << page_input1

    resource = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    image_input = ImageInput.new(resource)
    pdf.inputs << image_input
    image_input.align = Align::CENTER
    image_input.v_align = VAlign::CENTER
    image_input.page_width = 400
    image_input.page_height = 400

    # create EvenAddTemplate with pagenumbering label
    template_c = Template.new('TemplateC')
    page_numbering_element2 = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::BOTTOM_CENTER)
    template_c.elements << page_numbering_element2

    image_input.set_template(template_c)

    empty_page_resource = PdfResource.new("#{INPUT_PATH}Emptypages.pdf")
    empty_pages_pdf_input = PdfInput.new(empty_page_resource)
    empty_pages_pdf_input.set_template(template_a)

    pdf.inputs << empty_pages_pdf_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples30.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplatePagenumberingSamples30.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end
end
