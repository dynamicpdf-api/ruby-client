require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class TemplateBarcodeSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PageInputAztecBarcodeElementProperties_Pdfoutput
    @name = "PageInputAztecBarcodeElementProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    template = Template.new("Temp1")

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::BOTTOM_RIGHT)
    element.symbol_size = AztecSymbolSize::R105_X_C105
    element.x_dimension = 3
    element.color = RgbColor.red
    element.aztec_error_correction = 30
    element.process_tilde = true
    element.reader_initialization_symbol = true
    element.value = "test123"
    element.x_offset = -100
    element.y_offset = -100
    template.elements << element

    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageInputAztecBarcodeElement_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputAztecBarcodeElement_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElement_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElement"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_LEFT, 0, 0)
    element.placement = ElementPlacement::TOP_LEFT
    element.x_offset = 50
    element.y_offset = 50
    element.x_dimension = 3
    element.process_tilde = true
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FilePathDataMatrixBarcodeElement_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FilePathDataMatrixBarcodeElement_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootPdf417BarcodeElementProperties_Pdfoutput
    @name = "CloudRootPdf417BarcodeElementProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")
    pdf.inputs << input

    template = Template.new("Temp1")

    element = Pdf417BarcodeElement.new("Hello World", 2, ElementPlacement::TOP_LEFT)
    element.color = RgbColor.red
    element.compaction = Compaction::TEXT
    element.compact_pdf417 = true
    element.error_correction = ErrorCorrection::LEVEL_6
    element.even_pages = true
    element.placement = ElementPlacement::TOP_RIGHT
    element.process_tilde = true
    element.x_dimension = 4
    element.y_dimension = 5
    element.x_offset = -50
    element.y_offset = 50

    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}CloudRootPdf417BarcodeElement_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}CloudRootPdf417BarcodeElement_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamQrcodeBarcodeElementProperties_PdfOutput
    @name = "StreamQrcodeBarcodeElementProperties"

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

    template = Template.new("Temp1")

    element = QrCodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 50, 50)
    element.color = RgbColor.orange
    element.version = 20
    element.fnc1 = QrCodeFnc1::GS1
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}StreamQrcodeBarcodeElement_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}StreamQrcodeBarcodeElement_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesCode128Barcode_PdfOutput
    @name = "BytesCode128Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", "rb")

    resource = PdfResource.new(file.read.unpack("C*"))

    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}BytesCode128Barcode_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}BytesCode128Barcode_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputCode39Barcode_PdfOutput
    @name = "PageInputCode39Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageInputCode39Barcode_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputCode39Barcode_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesCode25Barcode_PdfOutput
    @name = "BytesCode25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}DocumentA100.pdf", "rb")

    resource = PdfResource.new(file.read.unpack("C*"))

    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}BytesCode25Barcode_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}BytesCode25Barcode_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputCode93Barcode_PdfOutput
    @name = "PageInputCode93Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageInputCode93Barcode_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputCode93Barcode_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamCode11Barcode_PdfOutput
    @name = "StreamCode11Barcode"

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
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}StreamCode11Barcode_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}StreamCode11Barcode_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderGs1DataBarBarcode_PdfOutput
    @name = "CloudSubFolderGs1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}CloudSubFolderGs1DataBarBarcode_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}CloudSubFolderGs1DataBarBarcode_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputStackedGS1DataBarBarcode_PdfOutput
    @name = "PageInputStackedGS1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 25, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageInputStackedGS1DataBarBarcode_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputStackedGS1DataBarBarcode_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputWithTemplateIata25Barcode_PdfOutput
    @name = "PageInputWithTemplateIata25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element

    page_input.set_template(template)

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PageInputWithTemplateIata25Barcode_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PageInputWithTemplateIata25Barcode_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMsiBarcode_PdfOutput
    @name = "FilePathMsiBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = MsiBarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FilePathMsiBarcode_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FilePathMsiBarcode_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
