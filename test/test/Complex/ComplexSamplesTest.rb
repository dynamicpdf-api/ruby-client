require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

class ComplexSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  # #TEST#
  def test_PdfInputPageInput_PageAndPdf_PdfOutput
    @name = "PageAndPdf"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new("First Page", ElementPlacement::TOP_LEFT)

    page_input.elements << element
    pdf.inputs << page_input

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    pdf_input = PdfInput.new(resource)
    pdf.inputs << pdf_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples1.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples1.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_SamePageInput_PdfOutput
    @name = "SamePageInput"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new("Hello World", ElementPlacement::TOP_LEFT)

    page_input.elements << element
    pdf.inputs << page_input
    pdf.inputs << page_input
    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples2.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples2.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_PageInputWithSameFont_PdfOutput
    @name = "PageInputWithSameFont"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new("Hello World", ElementPlacement::TOP_LEFT)
    font = Font.from_file("#{INPUT_PATH}verdanab.ttf")
    element.font(font)
    page_input.elements << element
    pdf.inputs << page_input

    page_input1 = PageInput.new
    element1 = TextElement.new("Hello World", ElementPlacement::TOP_LEFT)
    font1 = Font.from_file("#{INPUT_PATH}verdanab.ttf")
    element1.font(font1)
    page_input1.elements << element1
    pdf.inputs << page_input1

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples3.pdf", "wb") { |file| file.write(response.content) }
    end
    File.open("#{OUTPUT_PATH}ComplexSamples3.json", "w") { |file| file.write(pdf.get_instructions_json) }
    assert response.is_successful, response.error_message
  end

  def test_PageInput_SamePageInputWithImage_PdfOutput
    @name = "SamePageInputWithImage"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    image_resource = ImageResource.new("#{INPUT_PATH}Image1.jpg")
    image_element = ImageElement.new(image_resource, ElementPlacement::TOP_LEFT)

    page_input.elements << image_element
    pdf.inputs << page_input
    pdf.inputs << page_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples4.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples4.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInput_MergeSamePdfInput_PdfOutput
    @name = "MergeSamePdfInput"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    pdf_input = PdfInput.new(resource)
    pdf.inputs << pdf_input
    pdf.inputs << pdf_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples5.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples5.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputPageInput_MergeSamePdfAndAppendPage_PdfOutput
    @name = "MergeSamePdfAndAppendPage"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new("First Page", ElementPlacement::TOP_LEFT)
    element.color = RgbColor.red
    element.font(Font.courier_bold)
    element.font_size = 20
    page_input.elements << element
    pdf.inputs << page_input

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    pdf_input = PdfInput.new(resource)
    pdf.inputs << pdf_input

    resource1 = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    pdf_input1 = PdfInput.new(resource1)
    pdf.inputs << pdf_input1

    pdf_input2 = PdfInput.new("DocumentA100.pdf")
    pdf.inputs << pdf_input2

    page_input1 = PageInput.new
    element1 = TextElement.new("Last Page", ElementPlacement::TOP_LEFT)
    element1.color = RgbColor.blue
    element1.font(Font.times_italic)
    element1.font_size = 20
    page_input1.elements << element1
    pdf.inputs << page_input1

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples6.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples6.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_ImageInput_AddSameImageInput_PdfOutput
    @name = "AddSameImageInput"
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}Image1.jpg")
    image_input = ImageInput.new(resource)
    pdf.inputs << image_input

    pdf.inputs << image_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples7.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples7.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_ImageInputPageInputPdfInput_AddSameImages_PdfOutput
    @name = "AddSameImages"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new("Add Same Image Resource", ElementPlacement::TOP_LEFT)
    page_input.elements << element
    pdf.inputs << page_input

    resource = ImageResource.new("#{INPUT_PATH}Image1.jpg")
    image_input = ImageInput.new(resource)
    pdf.inputs << image_input

    resource1 = ImageResource.new("#{INPUT_PATH}Image1.jpg")
    image_input1 = ImageInput.new(resource1)
    image_input1.top_margin = 50
    image_input1.bottom_margin = 50
    image_input1.left_margin = 50
    image_input1.right_margin = 50
    pdf.inputs << image_input1

    resource2 = ImageResource.new("#{INPUT_PATH}170x220_T.png")
    image_input2 = ImageInput.new(resource2)
    pdf.inputs << image_input2

    image_input3 = ImageInput.new("Image1.jpg")
    pdf.inputs << image_input3

    resource3 = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    pdf_input = PdfInput.new(resource3)
    image_element = ImageElement.new(resource1, ElementPlacement::TOP_LEFT)
    image_element.x_offset = 25
    image_element.y_offset = 25
    template = Template.new("Temp1")
    template.elements << image_element
    pdf_input.set_template(template)
    pdf.inputs << pdf_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples8.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples8.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_DlexInputPageInput_AddSameDlexInput_PdfOutput
    @name = "AddSameDlexInput"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    img = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif", "northwind logo.gif")
    pdf.resources["Northwind Logo"] = img

    dlex = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex")
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    input = DlexInput.new(dlex, layout_data)
    pdf.inputs << input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples9.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples9.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_DlexInputPageInput_AddSameDlex_PdfOutput
    @name = "AddSameDlex"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new("Hello World", ElementPlacement::TOP_LEFT)
    element.font_size = 20
    page_input.elements << element
    pdf.inputs << page_input

    img = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif", "northwind logo.gif")
    pdf.resources["Northwind Logo"] = img

    dlex = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex")
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    input = DlexInput.new(dlex, layout_data)
    pdf.inputs << input

    dlex1 = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex")
    layout_data1 = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    input1 = DlexInput.new(dlex1, layout_data1)
    pdf.inputs << input1

    input2 = DlexInput.new("SimpleReportWithCoverPage.dlex", "SimpleReportData.json")
    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples10.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples10.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputPageInput_ElemetsWithSecurity_PdfOutput
    @name = "ElemetsWithSecurity"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    aes128_security = Aes128Security.new("", "owner")
    aes128_security.allow_print = false
    # pdf.security = aes128_security

    page_input = PageInput.new
    rectangle_element = RectangleElement.new(100, 100, ElementPlacement::TOP_LEFT)
    rectangle_element.border_color = RgbColor.red
    rectangle_element.fill_color = RgbColor.green
    rectangle_element.border_width = 3
    page_input.elements << rectangle_element

    text_element = TextElement.new("Rectangle Element", ElementPlacement::TOP_CENTER)
    page_input.elements << text_element
    pdf.inputs << page_input

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    pdf_input = PdfInput.new(resource)
    template = Template.new("Temp1")

    line_element = LineElement.new(600, 50, ElementPlacement::TOP_LEFT)
    line_element.color = RgbColor.blue
    line_element.x_offset = 10
    line_element.y_offset = 50
    line_element.width = 2
    line_element.line_style = LineStyle.dots
    template.elements << line_element
    pdf_input.set_template(template)
    pdf.inputs << pdf_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples11.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples11.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputImageInput_DifferentElemnts_PdfOutput
    @name = "DifferentElemnts"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    text_element = TextElement.new("Hello World", ElementPlacement::TOP_LEFT)
    text_element.font_size = 40
    page_input.elements << text_element

    page_numbering = PageNumberingElement.new("%%CP%% of %%TP%%", ElementPlacement::TOP_CENTER)
    page_numbering.y_offset = -20
    page_input.elements << page_numbering

    rectangle_element = RectangleElement.new(200, 150, ElementPlacement::TOP_LEFT)
    rectangle_element.y_offset = 100
    page_input.elements << rectangle_element

    line_element = LineElement.new(400, 400, ElementPlacement::TOP_LEFT)
    line_element.y_offset = 400
    line_element.color = RgbColor.red
    page_input.elements << line_element

    font = Font.from_file("#{INPUT_PATH}Calibri.otf")
    code128_barcode_element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::BOTTOM_LEFT)
    code128_barcode_element.font(font)
    page_input.elements << code128_barcode_element

    aztec_barcode_element = AztecBarcodeElement.new("Hello World", ElementPlacement::BOTTOM_RIGHT)
    aztec_barcode_element.color = RgbColor.blue
    page_input.elements << aztec_barcode_element
    pdf.inputs << page_input

    page_input1 = PageInput.new
    image_resource = ImageResource.new("#{INPUT_PATH}Image1.jpg")
    image_element = ImageElement.new(image_resource, ElementPlacement::TOP_LEFT)
    image_element.scale_x = 0.5
    image_element.scale_y = 0.5
    page_input1.elements << image_element
    page_input1.elements << page_numbering
    pdf.inputs << page_input1

    template = Template.new("TempA")
    template.elements << page_numbering

    image_input = ImageInput.new(image_resource)
    image_input.top_margin = 50
    image_input.set_template(template)
    pdf.inputs << image_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples12.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples12.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_Inputs_DifferentInputs_PdfOutput
    @name = "DifferentInputs"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_input = PdfInput.new("DocumentA100.pdf")
    merge_options = MergeOptions.new
    pdf_input.merge_options = merge_options
    pdf.inputs << pdf_input

    page_input = PageInput.new
    text_element = TextElement.new("Hello World", ElementPlacement::TOP_LEFT)
    text_element.font_size = 40
    page_input.elements << text_element
    pdf.inputs << page_input

    img = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif", "northwind logo.gif")
    pdf.resources["Northwind Logo"] = img
    dlex_input = DlexInput.new("SimpleReportWithCoverPage.dlex", "SimpleReportData.json")
    pdf.inputs << dlex_input

    image_input = ImageInput.new("Image1.jpg")
    image_input.top_margin = 10
    image_input.left_margin = 10
    image_input.right_margin = 10
    image_input.bottom_margin = 10
    pdf.inputs << image_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples13.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples13.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInputs_DifferentBarcode_PdfOutput
    @name = "DifferentBarcode"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    text_element = TextElement.new("1D Barcodes", ElementPlacement::TOP_CENTER, 0, -20)
    page_input.elements << text_element

    element1 = TextElement.new("Code128Barcode", ElementPlacement::TOP_LEFT, 0, 20)
    page_input.elements << element1
    code128_barcode_element = Code128BarcodeElement.new("Code 128 Barcode.", 50, ElementPlacement::TOP_LEFT)
    code128_barcode_element.y_offset = 50
    page_input.elements << code128_barcode_element

    element2 = TextElement.new("Code39Barcode", ElementPlacement::TOP_RIGHT, 0, 20)
    page_input.elements << element2
    code39_barcode_element = Code39BarcodeElement.new("CODE 39", 50, ElementPlacement::TOP_RIGHT)
    code39_barcode_element.y_offset = 50
    page_input.elements << code39_barcode_element

    element3 = TextElement.new("Code25Barcode", ElementPlacement::TOP_LEFT, 0, 220)
    page_input.elements << element3
    code25_barcode_element = Code25BarcodeElement.new("1234567890", 50, ElementPlacement::TOP_LEFT)
    code25_barcode_element.y_offset = 250
    page_input.elements << code25_barcode_element

    element4 = TextElement.new("Code93Barcode", ElementPlacement::TOP_CENTER, 0, 220)
    page_input.elements << element4
    code93_barcode_element = Code93BarcodeElement.new("CODE 93", 50, ElementPlacement::TOP_CENTER)
    code93_barcode_element.y_offset = 250
    page_input.elements << code93_barcode_element

    element5 = TextElement.new("Code11Barcode", ElementPlacement::TOP_RIGHT, 0, 220)
    page_input.elements << element5
    code11_barcode_element = Code11BarcodeElement.new("12345678", 50, ElementPlacement::TOP_RIGHT)
    code11_barcode_element.y_offset = 250
    page_input.elements << code11_barcode_element

    element6 = TextElement.new("Gs1DataBarBarcode", ElementPlacement::TOP_LEFT, 0, 420)
    page_input.elements << element6
    gs1_data_bar_barcode_element = Gs1DataBarBarcodeElement.new("12345678", 50, Gs1DataBarType::OMNIDIRECTIONAL, ElementPlacement::TOP_LEFT)
    gs1_data_bar_barcode_element.y_offset = 450
    page_input.elements << gs1_data_bar_barcode_element

    element7 = TextElement.new("StackedGs1DataBarBarcode", ElementPlacement::TOP_CENTER, 0, 420)
    page_input.elements << element7
    stacked_gs1_data_bar_barcode_element = StackedGs1DataBarBarcodeElement.new("12345678", StackedGs1DataBarType::STACKED, 25, ElementPlacement::TOP_CENTER)
    stacked_gs1_data_bar_barcode_element.y_offset = 450
    page_input.elements << stacked_gs1_data_bar_barcode_element

    element8 = TextElement.new("Iata25Barcode", ElementPlacement::TOP_RIGHT, 0, 420)
    page_input.elements << element8
    iata25_barcode_element = Iata25BarcodeElement.new("12345678", 50, ElementPlacement::TOP_RIGHT)
    iata25_barcode_element.y_offset = 450
    page_input.elements << iata25_barcode_element

    element9 = TextElement.new("MsiBarcode", ElementPlacement::TOP_CENTER, 0, 620)
    page_input.elements << element9
    msi_barcode_element = MsiBarcodeElement.new("1234567890", 50, ElementPlacement::TOP_CENTER)
    msi_barcode_element.y_offset = 650
    page_input.elements << msi_barcode_element

    pdf.inputs << page_input

    page_input1 = PageInput.new
    text_element1 = TextElement.new("2D Barcodes", ElementPlacement::TOP_CENTER, 0, -20)
    page_input1.elements << text_element1

    element10 = TextElement.new("AztecBarcode", ElementPlacement::TOP_LEFT, 0, 20)
    page_input1.elements << element10
    aztec_barcode_element = AztecBarcodeElement.new("Hello World", ElementPlacement::TOP_LEFT)
    aztec_barcode_element.y_offset = 50
    page_input1.elements << aztec_barcode_element

    element11 = TextElement.new("DataMatrixBarcode", ElementPlacement::TOP_RIGHT, 0, 20)
    page_input1.elements << element11
    data_matrix_barcode_element = DataMatrixBarcodeElement.new("Hello World", ElementPlacement::TOP_RIGHT)
    data_matrix_barcode_element.y_offset = 50
    page_input1.elements << data_matrix_barcode_element

    element12 = TextElement.new("Pdf417Barcode", ElementPlacement::TOP_LEFT, 0, 170)
    page_input1.elements << element12
    pdf417_barcode_element = Pdf417BarcodeElement.new("Hello World", 3, ElementPlacement::TOP_LEFT)
    pdf417_barcode_element.y_offset = 200
    page_input1.elements << pdf417_barcode_element

    element13 = TextElement.new("QrCode", ElementPlacement::TOP_RIGHT, 0, 170)
    page_input1.elements << element13
    qr_code_element = QrCodeElement.new("Hello World", ElementPlacement::TOP_RIGHT)
    qr_code_element.y_offset = 200
    page_input1.elements << qr_code_element

    pdf.inputs << page_input1

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples14.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples14.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputPageInput_ElementsWithout_lines_PdfOutput
    @name = "ElementsWithout_lines"

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    page_input.id = "page1"
    text_element = TextElement.new("Page Input With Eelements", ElementPlacement::TOP_LEFT)
    text_element.font(Font.from_file("#{INPUT_PATH}verdanab.ttf"))
    text_element.font_size = 20
    text_element.color = RgbColor.new(1, 0, 0)
    page_input.elements << text_element

    line_element = LineElement.new(400, 50, ElementPlacement::TOP_LEFT)
    line_element.y_offset = 50
    line_element.color = RgbColor.yellow
    page_input.elements << line_element

    template = Template.new("TemplatePage")
    page_numbering_element = PageNumberingElement.new("%%CP%% of %%TP%%", ElementPlacement::TOP_RIGHT)
    page_numbering_element.font(Font.courier)
    template.elements << page_numbering_element
    page_input.set_template(template)

    outline = pdf.out_lines.add("Outline Page Input")
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    link_to = GoToAction.new(page_input)
    link_to.page_zoom = PageZoom::FIT_PAGE

    outline.action = link_to

    pdf.inputs << page_input

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    pdf_input = PdfInput.new(resource)
    pdf_input.id = "pdf1"
    pdf_input.set_template(template)

    outline1 = pdf.out_lines.add("Outline Pdf Input")
    outline1.style = OutlineStyle::ITALIC

    link_to1 = GoToAction.new(pdf_input)
    link_to1.page_zoom = PageZoom::FIT_HEIGHT

    outline1.action = link_to1

    pdf.inputs << pdf_input

    img = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif", "northwind logo.gif")
    pdf.resources["Northwind Logo"] = img
    dlex = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex")
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    dlex_input = DlexInput.new(dlex, layout_data)
    dlex_input.id = "dlex1"

    outline2 = pdf.out_lines.add("Outline Dlex Input")
    outline2.style = OutlineStyle::REGULAR
    outline2.color = RgbColor.green

    link_to2 = GoToAction.new(dlex_input)
    link_to2.page_zoom = PageZoom::FIT_HEIGHT

    outline2.action = link_to2

    pdf.inputs << dlex_input

    image_resource = ImageResource.new("#{INPUT_PATH}Image1.jpg")
    image_input = ImageInput.new(image_resource)
    image_input.top_margin = 50
    image_input.left_margin = 50
    image_input.right_margin = 50
    image_input.bottom_margin = 50
    image_input.id = "img1"

    outline3 = pdf.out_lines.add("Outline Image Input")
    outline3.style = OutlineStyle::REGULAR
    outline3.color = RgbColor.blue

    link_to3 = GoToAction.new(image_input)
    link_to3.page_zoom = PageZoom::FIT_HEIGHT

    outline3.action = link_to3

    pdf.inputs << image_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ComplexSamples15.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ComplexSamples15.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
