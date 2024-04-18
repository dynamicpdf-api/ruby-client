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

  def test_FilePathInputAztecBarcode_Pdfoutput
    @name = "FilePathInputAztecBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input

    template = Template.new("Temp1")

    element = AztecBarcodeElement.new("Hello World", 0, 0)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples1.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples1.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathInputAztecBarcodeSize_Pdfoutput
    @name = "FilePathInputAztecBarcodeSize"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = AztecBarcodeElement.new("Hello World", 0, 0)
    element.placement = ElementPlacement::TOP_LEFT
    element.symbol_size = AztecSymbolSize::FULL
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples2.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples2.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathAztecBarcodeElementError_Pdfoutput
    @name = "FilePathAztecBarcodeElementError"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::TOP_RIGHT)
    element.symbol_size = AztecSymbolSize::COMPACT
    element.aztec_error_correction = 50
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples3.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples3.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathAztecBarcodeElementTilde_Pdfoutput
    @name = "FilePathAztecBarcodeElementTild"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input

    template = Template.new("Temp1")

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::BOTTOM_RIGHT)
    element.symbol_size = AztecSymbolSize::R109_X_C109
    element.process_tilde = true
    element.odd_pages = true
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples4.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples4.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathAztecBarcodeElementReader_Pdfoutput
    @name = "FilePathAztecBarcodeElementReader"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 50, 50)
    element.symbol_size = AztecSymbolSize::R109_X_C109
    element.process_tilde = true
    element.reader_initialization_symbol = true
    element.even_pages = true
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples5.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples5.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePath_AztecBarcodeElementXDimension_Pdfoutput
    @name = "FilePath_AztecBarcodeElementXDimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER)
    element.symbol_size = AztecSymbolSize::R109_X_C109
    element.process_tilde = true
    element.x_dimension = 3
    element.even_pages = true
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples6.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples6.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathAztecBarcodeElementColor_Pdfoutput
    @name = "FilePathAztecBarcodeElementColor"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::BOTTOM_RIGHT)
    element.symbol_size = AztecSymbolSize::R125_X_C125
    element.x_dimension = 3
    element.color = RgbColor.blue
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples7.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples7.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathAztecBarcodeElementProperties_Pdfoutput
    @name = "FilePathAztecBarcodeElementProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples8.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples8.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesAztecBarcodeElementProperties_Pdfoutput
    @name = "BytesAztecBarcodeElementProperties"

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

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::BOTTOM_RIGHT)
    element.symbol_size = AztecSymbolSize::R125_X_C125
    element.x_dimension = 3
    element.color = RgbColor.red
    element.aztec_error_correction = 30
    element.process_tilde = true
    element.reader_initialization_symbol = false
    element.value = "test123"
    element.x_offset = -100
    element.y_offset = -100
    template.elements << element

    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples9.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples9.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamAztecBarcodeElementProperties_Pdfoutput
    @name = "StreamAztecBarcodeElementProperties_Pdfoutput"

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

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::BOTTOM_RIGHT)
    element.symbol_size = AztecSymbolSize::R125_X_C125
    element.x_dimension = 3
    element.color = RgbColor.red
    element.aztec_error_correction = 30
    element.process_tilde = true
    element.reader_initialization_symbol = false
    element.value = "test123"
    element.x_offset = -100
    element.y_offset = -100
    template.elements << element

    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples10.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples10.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootAztecBarcodeElementProperties_Pdfoutput
    @name = "CloudRootAztecBarcodeElementProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")
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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples11.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples11.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples12.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples12.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputAztecBarcodeElementPropertiesAddedToPage_Pdfoutput
    @name = "PageInputAztecBarcodeElementPropertiesAddedToPage"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::BOTTOM_RIGHT)
    element.symbol_size = AztecSymbolSize::AUTO
    element.x_dimension = 3
    element.color = RgbColor.red
    element.aztec_error_correction = 30
    element.process_tilde = true
    element.reader_initialization_symbol = true
    element.value = "test123"
    element.x_offset = -100
    element.y_offset = -100
    input.elements << element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples13.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples13.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputAztecBarcodeAddedToPageAndPdf_Pdfoutput
    @name = "PageInputAztecBarcodeAddedToPageAndPdf"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    element = AztecBarcodeElement.new("Hello World", ElementPlacement::BOTTOM_RIGHT)
    element.symbol_size = AztecSymbolSize::R125_X_C125
    element.x_dimension = 3
    element.color = RgbColor.red
    element.aztec_error_correction = 30
    element.process_tilde = true
    element.reader_initialization_symbol = false
    element.value = "test123"
    element.x_offset = -100
    element.y_offset = -100
    input.elements << element

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    pdf_input = PdfInput.new(resource)
    pdf.inputs << pdf_input
    template = Template.new("Temp1")
    element1 = AztecBarcodeElement.new("Hello World", ElementPlacement::TOP_LEFT)
    element1.symbol_size = AztecSymbolSize::AUTO
    element1.x_dimension = 3
    element1.color = RgbColor.green
    element1.aztec_error_correction = 30
    element1.process_tilde = true
    element1.reader_initialization_symbol = true
    element1.x_offset = 100
    element1.y_offset = 100
    template.elements << element1
    pdf_input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples14.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples14.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathAztecBarcodeElementByteArray_Pdfoutput
    @name = "FilePathAztecBarcodeElementByteArray"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")
    value = "Hello World".unpack("C*")
    element = AztecBarcodeElement.new(value, ElementPlacement::TOP_LEFT, 0)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples15.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples15.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathAztecBarcodeElementPageByteArray_Pdfoutput
    @name = "FilePathAztecBarcodeElementPageByteArray"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    value = "Hello World".unpack("C*")
    element = AztecBarcodeElement.new(value, ElementPlacement::TOP_CENTER)
    element.color = RgbColor.green
    element.aztec_error_correction = 45
    element.symbol_size = AztecSymbolSize::FULL
    element.process_tilde = true
    element.reader_initialization_symbol = false
    input.elements << element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples16.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples16.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathAztecBarcodeElementPageXY_Pdfoutput
    @name = "FilePathAztecBarcodeElementPageXY"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    value = "Hello World".unpack("C*")
    element = AztecBarcodeElement.new(value, ElementPlacement::TOP_CENTER, 0, 100)
    element.color = RgbColor.green
    element.aztec_error_correction = 45
    element.symbol_size = AztecSymbolSize::AUTO
    element.process_tilde = true
    element.reader_initialization_symbol = true
    input.elements << element

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples17.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples17.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples18.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples18.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElementXDimension_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElementXDimension"

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
    element.x_dimension = 2
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples19.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples19.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElementColor_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElementColor"

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
    element.color = RgbColor.indigo
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples20.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples20.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElementPlacement_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElementPlacement"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_RIGHT, -50, 50)
    element.even_pages = true
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples21.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples21.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElementTilde_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElementTilde"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 0, 0)
    element.process_tilde = true
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples22.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples22.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElementSymbolSize_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElementSymbolSize"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 0, 0,
                                           DataMatrixSymbolSize::R120_X_C120)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples23.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples23.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElementEncodingType_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElementEncodingType"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 0, 0,
                                           DataMatrixSymbolSize::AUTO, DataMatrixEncodingType::BASE256)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples24.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples24.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElementFucntionChar_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElementFucntionChar"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 0, 0,
                                           DataMatrixSymbolSize::AUTO, DataMatrixEncodingType::AUTO, DataMatrixFunctionCharacter::FNC1)
    element.odd_pages = true
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples25.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples25.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElementEnums_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElementEnums"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 0, 0,
                                           DataMatrixSymbolSize::AUTO, DataMatrixEncodingType::ASCII, DataMatrixFunctionCharacter::NONE)
    element.odd_pages = true
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples26.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples26.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathDataMatrixBarcodeElementProperties_Pdfoutput
    @name = "FilePathDataMatrixBarcodeElementProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 0, 0,
                                           DataMatrixSymbolSize::R132_X_C132, DataMatrixEncodingType::C40, DataMatrixFunctionCharacter::MACRO05)
    element.process_tilde = true
    element.x_dimension = 5
    element.x_offset = 50
    element.y_offset = 50
    element.color = RgbColor.yellow
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples27.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples27.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesDataMatrixBarcodeElementProperties_Pdfoutput
    @name = "BytesDataMatrixBarcodeElementProperties"

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

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 0, 0,
                                           DataMatrixSymbolSize::R132_X_C132, DataMatrixEncodingType::C40, DataMatrixFunctionCharacter::MACRO05)
    element.process_tilde = true
    element.x_dimension = 5
    element.x_offset = 50
    element.y_offset = 50
    element.color = RgbColor.yellow
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples28.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples28.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamDataMatrixBarcodeElementProperties_Pdfoutput
    @name = "StreamDataMatrixBarcodeElementProperties"

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

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 0, 0,
                                           DataMatrixSymbolSize::R132_X_C132, DataMatrixEncodingType::C40, DataMatrixFunctionCharacter::MACRO05)
    element.process_tilde = true
    element.x_dimension = 5
    element.x_offset = 50
    element.y_offset = 50
    element.color = RgbColor.yellow
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples29.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples29.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootDataMatrixBarcodeElementProperties_Pdfoutput
    @name = "CloudRootDataMatrixBarcodeElementProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}DocumentA100.pdf", "rb")
    PdfResource.new(file)
    file.close

    input = PdfInput.new("DocumentA100.pdf")
    pdf.inputs << input

    template = Template.new("Temp1")

    element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 0, 0,
                                           DataMatrixSymbolSize::R132_X_C132, DataMatrixEncodingType::C40, DataMatrixFunctionCharacter::MACRO05)
    element.process_tilde = true
    element.x_dimension = 5
    element.x_offset = 50
    element.y_offset = 50
    element.color = RgbColor.yellow
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples30.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples30.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPdf417BarcodeElement_Pdfoutput
    @name = "FilePathPdf417BarcodeElement"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = Pdf417BarcodeElement.new("Hello World", 3, ElementPlacement::TOP_LEFT, 0, 0)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples31.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples31.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPdf417BarcodeElementTilde_Pdfoutput
    @name = "FilePathPdf417BarcodeElementTilde"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = Pdf417BarcodeElement.new("Hello World", 3, ElementPlacement::TOP_LEFT, 0, 0)
    element.process_tilde = true

    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples32.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples32.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPdf417BarcodeElementCompaction_Pdfoutput
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = Pdf417BarcodeElement.new("Hello World", 2, ElementPlacement::TOP_CENTER)

    element.compaction = Compaction::TEXT

    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples33.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples33.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPdf417BarcodeElementErrorCorrection_PDFOUT_put
    @name = "FilePathPdf417BarcodeElementErrorCorrection"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = Pdf417BarcodeElement.new("Hello World", 2, ElementPlacement::TOP_LEFT)
    element.error_correction = ErrorCorrection::LEVEL_2

    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples34.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples34.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPdf417BarcodeElementCompactPdf417_Pdfoutput
    @name = "FilePathPdf417BarcodeElementCompactPdf41"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = Pdf417BarcodeElement.new("Hello World", 2, ElementPlacement::TOP_LEFT)
    element.compact_pdf417 = true

    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples35.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples35.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPdf417BarcodeElementYDimension_Pdfoutput
    @name = "FilePathPdf417BarcodeElementYDimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = Pdf417BarcodeElement.new("Hello World", 2, ElementPlacement::TOP_LEFT)
    element.y_dimension = 3

    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples36.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples36.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPdf417BarcodeElementProperties_Pdfoutput
    @name = "FilePathPdf417BarcodeElementProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = Pdf417BarcodeElement.new("Hello World", 2, ElementPlacement::TOP_LEFT)
    element.color = RgbColor.red
    element.compaction = Compaction::BYTE
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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples37.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples37.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamPdf417BarcodeElementProperties_Pdfoutput
    @name = "StreamPdf417BarcodeElementProperties"
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

    element = Pdf417BarcodeElement.new("78910", 2, ElementPlacement::TOP_LEFT)
    element.color = RgbColor.red
    element.compaction = Compaction::NUMERIC
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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples38.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples38.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesPdf417BarcodeElementProperties_Pdfoutput
    @name = "BytesPdf417BarcodeElementProperties"

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

    element = Pdf417BarcodeElement.new("123456", 2, ElementPlacement::TOP_LEFT)
    element.color = RgbColor.red
    element.compaction = Compaction::NUMERIC
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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples39.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples39.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples40.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples40.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPdf417BarcodeElementByteArray_Pdfoutput
    @name = "FilePathPdf417BarcodeElementByteArray"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")
    value = "Hello World".unpack("C*")
    element = Pdf417BarcodeElement.new(value, 3, ElementPlacement::TOP_LEFT, 0, 0)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples41.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples41.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathQrcodeBarcodeElement_PdfOutput
    @name = "FilePathQrcodeBarcodeElement"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = QrCodeElement.new("Hello World", ElementPlacement::TOP_LEFT)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples42.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples42.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathQrcodeBarcodeElementVersion_PdfOutput
    @name = "FilePathQrcodeBarcodeElementVersion"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = QrCodeElement.new("Hello World", ElementPlacement::TOP_LEFT)
    element.version = 25
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples43.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples43.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathQrcodeBarcodeElementFnc1_PdfOutput
    @name = "FilePathQrcodeBarcodeElementFnc1"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")

    element = QrCodeElement.new("Hello World", ElementPlacement::BOTTOM_RIGHT)
    element.fnc1 = QrCodeFnc1::INDUSTRY
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples44.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples44.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathQrcodeBarcodeElementProperties_PdfOutput
    @name = "FilePathQrcodeBarcodeElementProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples45.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples45.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesQrcodeBarcodeElementProperties_PdfOutput
    @name = "BytesQrcodeBarcodeElementProperties"

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

    element = QrCodeElement.new("Hello World", ElementPlacement::TOP_CENTER, 50, 50)
    element.color = RgbColor.orange
    element.version = 20
    element.fnc1 = QrCodeFnc1::GS1
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples46.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples46.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples47.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples47.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootQrcodeBarcodeElementProperties_PdfOutput
    @name = "CloudRootQrcodeBarcodeElementProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")
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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples48.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples48.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathQrcodeBarcodeElementByteArray_PdfOutput
    @name = "FilePathQrcodeBarcodeElementByteArray"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    template = Template.new("Temp1")
    value = "Hello World".unpack("C*")
    element = QrCodeElement.new(value, ElementPlacement::TOP_LEFT)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples49.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples49.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128Barcode_PdfOutput
    @name = "FilePathCode128Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input
    template = Template.new("Temp1")

    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples50.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples50.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples51.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples51.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamCode128Barcode_PdfOutput
    @name = "StreamCode128Barcode"

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
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples52.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples52.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootCode128Barcode_PdfOutput
    @name = "CloudRootCode128Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples53.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples53.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderCode128Barcode_PdfOutput
    @name = "CloudSubFolderCode128Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples54.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples54.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128BarcodeWithOptionalParameter_PdfOutput
    @name = "FilePathCode128BarcodeWithOptionalParameter"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER, 50, 50)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples55.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples55.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128BarcodeWithHeightXY_PdfOutput
    @name = "FilePathCode128BarcodeWithHeightXY"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_LEFT)
    element.height = 60
    element.x_offset = 100
    element.y_offset = 100
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples56.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples56.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128BarcodeColorXdimension_PdfOutput
    @name = "FilePathCode128BarcodeColorXdimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 25, ElementPlacement::TOP_RIGHT)
    element.color = RgbColor.red
    element.x_dimension = 2
    element.show_text = false
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples57.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples57.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128BarcodeTextProperties_PdfOutput
    @name = "FilePathCode128BarcodeTextProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::BOTTOM_LEFT)
    element.show_text = true
    element.text_color = RgbColor.blue
    element.font(Font.courier)
    element.font_size = 15
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples58.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples58.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128BarcodePlacement_PdfOutput
    @name = "FilePathCode128BarcodePlacement"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_RIGHT)
    element.placement = ElementPlacement::BOTTOM_RIGHT
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples59.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples59.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128BarcodeProcessTilde_PdfOutput
    @name = "FilePathCode128BarcodeProcessTilde"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 ~ABarcode.", 50, ElementPlacement::TOP_CENTER)
    element.process_tilde = true

    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples60.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples60.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128BarcodeUccEan128_PdfOutput
    @name = "FilePathCode128BarcodeUccEan128"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    element.ucc_ean128 = true

    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples61.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples61.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128BarcodeEvenPages_PdfOutput
    @name = "FilePathCode128BarcodeEvenPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    element.even_pages = true

    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples62.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples62.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode128BarcodeOddPages_PdfOutput
    @name = "FilePathCode128BarcodeOddPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    element.odd_pages = true

    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples63.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples63.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputCode128Barcode_PdfOutput
    @name = "PageInputCode128Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples64.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples64.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputWithTemplateCode128Barcode_PdfOutput
    @name = "PageInputWithTemplateCode128Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    template = Template.new("Temp1")
    element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_CENTER)
    template.elements << element

    page_input.set_template(template)

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples65.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples65.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode39Barcode_PdfOutput
    @name = "FilePathCode39Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples66.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples66.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesCode39Barcode_PdfOutput
    @name = "BytesCode39Barcode"

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
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples67.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples67.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamCode39Barcode_PdfOutput
    @name = "StreamCode39Barcode"

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
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples68.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples68.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootCode39Barcode_PdfOutput
    @name = "CloudRootCode39Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples69.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples69.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderCode39Barcode_PdfOutput
    @name = "CloudSubFolderCode39Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples70.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples70.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode39BarcodeOptionalParameter_PdfOutput
    @name = "FilePathCode39BarcodeOptionalParameter"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 40, ElementPlacement::TOP_LEFT, 50, 50)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples71.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples71.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode39BarcodeHeightXY_PdfOutput
    @name = "FilePathCode39BarcodeHeightXY"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::TOP_CENTER)
    element.height = 60
    element.x_offset = 100
    element.y_offset = 100
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples72.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples72.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode39BarcodeColorXdimension_PdfOutput
    @name = "FilePathCode39BarcodeColorXdimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::BOTTOM_CENTER)
    element.color = RgbColor.red
    element.x_dimension = 1.5
    element.show_text = false
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples73.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples73.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode39BarcodeTextProperties_PdfOutput
    @name = "FilePathCode39BarcodeTextProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::BOTTOM_LEFT)
    element.show_text = true
    element.text_color = RgbColor.red
    element.font(Font.courier_bold)
    element.font_size = 15
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples74.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples74.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode39BarcodeEvenPages_PdfOutput
    @name = "FilePathCode39BarcodeEvenPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::BOTTOM_LEFT)
    element.even_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples75.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples75.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode39BarcodeOddPages_PdfOutput
    @name = "FilePathCode39BarcodeOddPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::BOTTOM_LEFT)
    element.odd_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples76.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples76.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples77.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples77.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputTemplateCode39Barcode_PdfOutput
    @name = "PageInputTemplateCode39Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::TOP_CENTER)
    template.elements << element

    page_input.set_template(template)

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples78.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples78.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode39BarcodeExtended_PdfOutput
    @name = "FilePathCode39BarcodeExtended"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code39BarcodeElement.new("Code 39", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples79.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples79.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode25Barcode_PdfOutput
    @name = "FilePathCode25Barcod"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples80.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples80.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples81.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples81.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamCode25Barcode_PdfOutput
    @name = "StreamCode25Barcode"

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
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples82.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples82.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootCode25Barcode_PdfOutput
    @name = "CloudRootCode25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples83.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples83.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderCode25Barcode_PdfOutput
    @name = "CloudSubFolderCode25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples84.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples84.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode25BarcodeOptionalParameter_PdfOutput
    @name = "FilePathCode25BarcodeOptionalParameter"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_LEFT, 50, 50)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples85.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples85.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode25BarcodeHeightXY_PdfOutput
    @name = "FilePathCode25BarcodeHeightXY"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 25, ElementPlacement::TOP_CENTER)
    element.height = 60
    element.x_offset = 100
    element.y_offset = 100
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples86.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples86.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode25BarcodeColorXdimension_PdfOutput
    @name = "FilePathCode25BarcodeColorXdimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    element.color = RgbColor.red
    element.x_dimension = 1.5
    element.show_text = false
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples87.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples87.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode25BarcodeTextProperties_PdfOutput
    @name = "FilePathCode25BarcodeTextProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    element.text_color = RgbColor.red
    element.font(Font.courier_bold_oblique)
    element.font_size = 15
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples88.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples88.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode25BarcodeEvenPages_PdfOutput
    @name = "FilePathCode25BarcodeEvenPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples89.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples89.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode25BarcodeOddPages_PdfOutput
    @name = "FilePathCode25BarcodeOddPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    element.odd_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples90.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples90.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputCode25Barcode_PdfOutput
    @name = "PageInputCode25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples91.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples91.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputTemplateCode25Barcode_PdfOutput
    @name = "PageInputTemplateCode25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    template = Template.new("Temp1")
    element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element

    page_input.set_template(template)

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples92.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples92.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode93Barcode_PdfOutput
    @name = "FilePathCode93Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples93.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples93.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesCode93Barcode_PdfOutput
    @name = "BytesCode93Barcode"

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
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples94.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples94.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamCode93Barcode_PdfOutput
    @name = "StreamCode93Barcode"

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
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples95.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples95.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootCode93Barcode_PdfOutput
    @name = "CloudRootCode93Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples96.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples96.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderCode93Barcode_PdfOutput
    @name = "CloudSubFolderCode93Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples97.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples97.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode93BarcodeOptionalParameter_PdfOutput
    @name = "FilePathCode93BarcodeOptionalParameter"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 40, ElementPlacement::TOP_LEFT, 50, 50)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples98.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples98.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode93BarcodeHeightXY_PdfOutput
    @name = "FilePathCode93BarcodeHeightXY"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    element.height = 60
    element.x_offset = 100
    element.y_offset = 100

    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples99.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples99.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode93BarcodeColorXdimension_PdfOutput
    @name = "FilePathCode93BarcodeColorXdimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::BOTTOM_CENTER)
    element.color = WebColor.new("#FF0000")
    element.x_dimension = 2
    element.show_text = false
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples100.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples100.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode93BarcodeTextProperties_PdfOutput
    @name = "FilePathCode93BarcodeTextProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    element.show_text = true
    element.text_color = RgbColor.red
    element.font(Font.times_bold_italic)
    element.font_size = 15
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples101.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples101.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode93BarcodeEvenPages_PdfOutput
    @name = "FilePathCode93BarcodeEvenPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples102.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples102.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode93BarcodeOddPages_PdfOutput
    @name = "FilePathCode93BarcodeOddPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    element.odd_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples103.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples103.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples104.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples104.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputTemplateCode93Barcode_PdfOutput
    @name = "PageInputTemplateCode93Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    template.elements << element

    page_input.set_template(template)

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples105.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples105.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode93BarcodeExtended_PdfOutput
    @name = "FilePathCode93BarcodeExtended"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code93BarcodeElement.new("Code 93", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples106.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples106.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode11Barcode_PdfOutput
    @name = "FilePathCode11Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples107.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples107.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesCode11Barcode_PdfOutput
    @name = "BytesCode11Barcode"

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
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples108.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples108.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples109.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples109.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootCode11Barcode_PdfOutput
    @name = "CloudRootCode11Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples110.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples110.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderCode11Barcode_PdfOutput
    @name = "CloudSubFolderCode11Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples111.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples111.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode11BarcodeOptionalParameter_PdfOutput
    @name = "FilePathCode11BarcodeOptionalParameter"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_LEFT, 10, 20)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples112.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples112.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode11BarcodeHeightXY_PdfOutput
    @name = "FilePathCode11BarcodeHeightXY"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    element.height = 60
    element.x_offset = 20
    element.y_offset = 20
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples113.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples113.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode11BarcodeColorXdimension_PdfOutput
    @name = "FilePathCode11BarcodeColorXdimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 25, ElementPlacement::BOTTOM_LEFT)
    element.color = RgbColor.green
    element.x_dimension = 3
    element.show_text = false
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples114.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples114.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode11BarcodeTextProperties_PdfOutput
    @name = "FilePathCode11BarcodeTextProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 40, ElementPlacement::BOTTOM_RIGHT)
    element.show_text = true
    element.text_color = RgbColor.red
    element.font(Font.helvetica_oblique)
    element.font_size = 15
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples115.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples115.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode11BarcodeEvenPages_PdfOutput
    @name = "FilePathCode11BarcodeEvenPage"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples116.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples116.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathCode11BarcodeOddPages_PdfOutput
    @name = "FilePathCode11BarcodeOddPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    element.odd_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples117.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples117.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputCode11Barcode_PdfOutput
    @name = "PageInputCode11Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples118.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples118.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputTemplateCode11Barcode_PdfOutput
    @name = "PdfInputTemplateCode11Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    template = Template.new("Temp1")
    element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element

    page_input.set_template(template)

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples119.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples119.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathGs1DataBarBarcode_PdfOutput
    @name = "FilePathGs1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples120.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples120.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesGs1DataBarBarcode_PdfOutput
    @name = "BytesGs1DataBarBarcode"

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
    element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples121.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples121.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamGs1DataBarBarcode_PdfOutput
    @name = "StreamGs1DataBarBarcode"

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
    element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples122.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples122.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootGs1DataBarBarcode_PdfOutput
    @name = "CloudRootGs1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples123.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples123.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples124.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples124.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathGs1DataBarBarcodeOptionalParameter_PdfOutput
    @name = "FilePathGs1DataBarBarcodeOptionalParameter"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_LEFT,
                                           50, 50)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples125.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples125.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathGs1DataBarBarcodeHeightXY_PdfOutput
    @name = "FilePathGs1DataBarBarcodeHeightXY"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 10, Gs1DataBarType::EXPANDED, ElementPlacement::TOP_CENTER)
    element.height = 60
    element.height = 50
    element.x_offset = 0
    element.y_offset = 100
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples126.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples126.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathGs1DataBarBarcodeColorXdimension_PdfOutput
    @name = "FilePathGs1DataBarBarcodeColorXdimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 60, Gs1DataBarType::LIMITED, ElementPlacement::BOTTOM_LEFT)
    element.color = WebColor.new("#02F1A5")
    element.x_dimension = 1.4
    element.show_text = false
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples127.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples127.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathGs1DataBarBarcodeTextProperties_PdfOutput
    @name = "FilePathGs1DataBarBarcodeTextProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 40, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_CENTER)
    element.show_text = true
    element.text_color = RgbColor.red
    element.font_size = 10
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples128.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples128.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathGs1DataBarBarcodeEvenPages_PdfOutput
    @name = "FilePathGs1DataBarBarcodeEvenPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples129.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples129.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathGs1DataBarBarcodeOddPages_PdfOutput
    @name = "FilePathGs1DataBarBarcodeOddPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 40, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_CENTER)
    element.odd_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples130.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples130.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputGs1DataBarBarcode_PdfOutput
    @name = "PageInputGs1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples131.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples131.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputTamplateGs1DataBarBarcode_PdfOutput
    @name = "PageInputTamplateGs1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    template = Template.new("Temp1")
    element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::EXPANDED, ElementPlacement::TOP_CENTER)
    template.elements << element

    page_input.set_template(template)

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples132.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples132.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathStackedGS1DataBarBarcode_PdfOutput
    @name = "FilePathStackedGS1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 25, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples133.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples133.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesStackedGS1DataBarBarcode_PdfOutput
    @name = "BytesStackedGS1DataBarBarcode"

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
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 25, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples134.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples134.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamStackedGS1DataBarBarcode_PdfOutput
    @name = "StreamStackedGS1DataBarBarcode"

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
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 25, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples135.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples135.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootStackedGS1DataBarBarcode_PdfOutput
    @name = "CloudRootStackedGS1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 25, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples136.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples136.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderStackedGS1DataBarBarcode_PdfOutput
    @name = "CloudSubFolderStackedGS1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 25, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples137.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples137.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathStackedGS1DataBarBarcodeOptionalParameter_PdfOutput
    @name = "FilePathStackedGS1DataBarBarcodeOptionalParameter"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 20, ElementPlacement::TOP_CENTER, 10, 10)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples138.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples138.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathStackedGS1DataBarBarcodeRowheightXY_PdfOutput
    @name = "FilePathStackedGS1DataBarBarcodeRowheightXY"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::EXPANDED_STACKED, 50, ElementPlacement::TOP_LEFT)
    element.row_height = 60
    element.x_offset = 10
    element.y_offset = 20
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples139.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples139.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathStackedGS1DataBarBarcodeColorXdimension_PdfOutput
    @name = "FilePathStackedGS1DataBarBarcodeColorXdimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED_OMNIDIRECTIONAL, 30, ElementPlacement::TOP_CENTER)
    element.color = RgbColor.maroon
    element.x_dimension = 1
    element.show_text = false
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples140.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples140.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathStackedGS1DataBarBarcodeTextProperties_PdfOutput
    @name = "FilePathStackedGS1DataBarBarcodeTextProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 20, ElementPlacement::BOTTOM_CENTER)
    element.show_text = true
    element.text_color = RgbColor.gold
    element.font(Font.helvetica_bold)
    element.font_size = 14
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples141.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples141.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathStackedGS1DataBarBarcodeEvenPages_PdfOutput
    @name = "FilePathStackedGS1DataBarBarcodeEvenPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED_OMNIDIRECTIONAL, 30, ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples142.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples142.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathStackedGS1DataBarBarcodeOddPages_PdfOutput
    @name = "FilePathStackedGS1DataBarBarcodeOddPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED_OMNIDIRECTIONAL, 30, ElementPlacement::TOP_CENTER)
    element.odd_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples143.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples143.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples144.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples144.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputTemplateStackedGS1DataBarBarcode_PdfOutput
    @name = "PageInputTemplateStackedGS1DataBarBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    template = Template.new("Temp1")
    element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 50, ElementPlacement::TOP_CENTER)
    element.expanded_stacked_segment_count = 6
    template.elements << element

    page_input.set_template(template)

    pdf.inputs << page_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples145.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples145.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathIata25Barcode_PdfOutput
    @name = "FilePathIata25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples146.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples146.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesIata25Barcode_PdfOutput
    @name = "BytesIata25Barcode"

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
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples147.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples147.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamIata25Barcode_PdfOutput
    @name = "StreamIata25Barcode"

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
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples148.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples148.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputCloudRoot_Iata25Barcode_PdfOutput
    @name = "PdfInputCloudRoot_Iata25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples149.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples149.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderIata25Barcode_PdfOutput
    @name = "CloudSubFolderIata25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples150.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples150.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathIata25BarcodeOptionalParameter_PdfOutput
    @name = "FilePathIata25BarcodeOptionalParameter"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER, 10, 20)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples151.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples151.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathIata25BarcodeHeightXY_PdfOutput
    @name = "FilePathIata25BarcodeHeightXY"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_LEFT)
    element.height = 60
    element.x_offset = 10
    element.y_offset = 15
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples152.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples152.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathIata25BarcodeColorXdimension_PdfOutput
    @name = "FilePathIata25BarcodeColorXdimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 30, ElementPlacement::BOTTOM_RIGHT)
    element.color = RgbColor.yellow
    element.x_dimension = 3
    element.show_text = false
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples153.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples153.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathIata25BarcodeTextProperties_PdfOutput
    @name = "FilePathIata25BarcodeTextProperties"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    element.text_color = RgbColor.pink
    font = Font.from_file("#{INPUT_PATH}aial.ttf")
    element.font(font)
    element.font_size = 11
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples154.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples154.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathIata25BarcodeIncludeCheckDigit_PdfOutput
    @name = "FilePathIata25BarcodeIncludeCheckDigit"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    element.include_check_digit = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples155.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples155.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathIata25BarcodeEvenPages_PdfOutput
    @name = "FilePathIata25BarcodeEvenPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 30, ElementPlacement::BOTTOM_RIGHT)
    element.even_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples156.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples156.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathIata25BarcodeOddPages_PdfOutput
    @name = "FilePathIata25BarcodeOddPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = Iata25BarcodeElement.new("12345678", 30, ElementPlacement::BOTTOM_RIGHT)
    element.odd_pages = true
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples157.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples157.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputIata25Barcode_PdfOutput
    @name = "PageInputIata25Barcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples158.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples158.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples159.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples159.json", "w") { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples160.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples160.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesMsiBarcode_PdfOutput
    @name = "BytesMsiBarcode"

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
    element = MsiBarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples161.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples161.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamMsiBarcode_PdfOutput
    @name = "StreamMsiBarcode"

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
    element = MsiBarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples162.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples162.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootMsiBarcode_PdfOutput
    @name = "CloudRootMsiBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = MsiBarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples163.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples163.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderMsiBarcode_PdfOutput
    @name = "CloudSubFolderMsiBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new("Resources/DocumentA100.pdf")

    pdf.inputs << input
    template = Template.new("Temp1")
    element = MsiBarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples164.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples164.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMsiBarcodeOptionalParameter_PdfOutput
    @name = "FilePathMsiBarcodeOptionalParameter"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = MsiBarcodeElement.new("1234567890", 10, ElementPlacement::TOP_LEFT, 20)
    element.height = 50
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples165.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples165.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMsiBarcodeHeightXYAppendcheckdigit_PdfOutput
    @name = "FilePathMsiBarcodeHeightXYAppendcheckdigit"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = MsiBarcodeElement.new("1234567890", 30, ElementPlacement::TOP_CENTER)
    element.height = 60
    element.x_offset = 20
    element.y_offset = 20
    element.append_check_digit = MsiBarcodeCheckDigitMode::MOD11
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples166.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples166.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMsiBarcodeColorXdimension_PdfOutput
    @name = "FilePathMsiBarcodeColorXdimension"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = MsiBarcodeElement.new("1234567890", 40, ElementPlacement::BOTTOM_RIGHT)
    element.color = RgbColor.violet
    element.x_dimension = 2
    element.show_text = false
    element.append_check_digit = MsiBarcodeCheckDigitMode::MOD1010
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples167.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples167.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMsiBarcodeTextProperties_PdfOutput
    @name = "FilePathMsiBarcodeTextProperties"

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

    element.text_color = RgbColor.aqua
    element.font(Font.times_italic)
    element.font_size = 10
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples168.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples168.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMsiBarcodeAppendCheckDigit_PdfOutput
    @name = "FilePathMsiBarcodeEvenPages"

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

    element.append_check_digit = MsiBarcodeCheckDigitMode::MOD1110
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples169.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples169.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMsiBarcodeEvenPages_PdfOutput
    @name = "FilePathMsiBarcodeEvenPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = MsiBarcodeElement.new("1234567890", 30, ElementPlacement::TOP_CENTER)
    element.even_pages = true
    element.append_check_digit = MsiBarcodeCheckDigitMode::MOD10
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples170.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples170.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMsiBarcodeOddPages_PdfOutput
    @name = "FilePathMsiBarcodeOddPages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    template = Template.new("Temp1")
    element = MsiBarcodeElement.new("1234567890", 30, ElementPlacement::TOP_CENTER)
    element.odd_pages = true
    element.append_check_digit = MsiBarcodeCheckDigitMode::NONE
    template.elements << element
    input.set_template(template)
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples171.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples171.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputMsiBarcode_PdfOutput
    @name = "PageInputMsiBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = MsiBarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}TemplateBarcodeSamples172.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}TemplateBarcodeSamples172.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
