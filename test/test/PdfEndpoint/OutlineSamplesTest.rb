require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

class OutlineSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PdfInputUsingFilePath_Outline_Pdfoutput
    @name = 'PdfInputFilePathOutline'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}Emptypages.pdf")
    input = PdfInput.new(resource)
    input.id = '2'
    pdf.inputs << input

    outline = pdf.out_lines.add('OutlineA')
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_OutlineAll_Pdfoutput
    @name = 'PdfInputFilePathOutlineAll'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice_input = PdfInput.new(invoice_resource)
    invoice_input.id = 'invoice'
    pdf.inputs << invoice_input

    image_resource = ImageResource.new("#{INPUT_PATH}CCITT_1.tif")
    image_input = ImageInput.new(image_resource)
    image_input.id = 'picture'
    pdf.inputs << image_input

    merge_outline_resource = PdfResource.new("#{INPUT_PATH}MergeOutlineInput.pdf")
    merge_outline_input = PdfInput.new(merge_outline_resource)
    merge_outline_input.id = 'docA100'
    pdf.inputs << merge_outline_input

    outline = pdf.out_lines.add('Invoice')
    action = GoToAction.new(invoice_input)
    outline.action = action

    outline1 = pdf.out_lines.add('Picture')
    action1 = GoToAction.new(image_input)
    outline1.action = action1

    outline2 = pdf.out_lines.add('Outlines in Doc A 100')
    outline2.children.add_pdf_outlines(merge_outline_input)

    outline3 = pdf.out_lines.add('DynamicPDF is Cool!')
    action3 = UrlAction.new('https://www.dynamicpdf.com')
    outline3.action = action3

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_ChildrenSimplegoto_Pdfoutput
    @name = 'PdfInputFilePathOutlineChildrenGoto'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    empty_pagesresource = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    empty_input = PdfInput.new(empty_pagesresource)
    empty_input.id = 'document1'
    pdf.inputs << empty_input

    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100_input = PdfInput.new(document_a100_resource)
    document_a100_input.id = 'document2'
    pdf.inputs << document_a100_input

    outline = pdf.out_lines.add('OutlineA')
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    link_to = GoToAction.new(empty_input)
    link_to.page_offset = 5
    link_to.page_zoom = PageZoom::FIT_PAGE

    outline.action = link_to

    outline_a1 = outline.children.add('OutlineA1')
    outline_a1.color = RgbColor.red
    outline_a1.style = OutlineStyle::BOLD
    outline_a1.expanded = true

    link_to1 = GoToAction.new(document_a100_input)
    link_to1.page_offset = 10
    link_to1.page_zoom = PageZoom::FIT_PAGE

    outline_a1.action = link_to1

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_children_simplegotoOutOfPageIndexLeve1_Exception
    @name = 'PdfInputFilePathOutlineOutOfPageIndex'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    input = PdfInput.new(resource)
    input.id = 'document1'
    pdf.inputs << input

    resource2 = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    input2 = PdfInput.new(resource2)
    input2.id = 'document1'
    pdf.inputs << input2

    resource1 = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input1 = PdfInput.new(resource1)
    input1.id = 'document2'
    pdf.inputs << input1

    outline = pdf.out_lines.add('OutlineA')
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    link_to = GoToAction.new(input)
    link_to.page_offset = 5
    link_to.page_zoom = PageZoom::FIT_PAGE

    outline.action = link_to

    outline_a1 = outline.children.add('OutlineA1')
    outline_a1.color = RgbColor.red
    outline_a1.style = OutlineStyle::BOLD
    outline_a1.expanded = true

    link_to1 = GoToAction.new(input1)
    link_to1.page_offset = -10
    link_to1.page_zoom = PageZoom::FIT_PAGE

    outline_a1.action = link_to1

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_OutlineFrominputidFromChildren_Pdfoutput
    @name = 'OutlineFrominputidFromChildren'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource2 = PdfResource.new("#{INPUT_PATH}MergeOutlineInput.pdf")
    input2 = PdfInput.new(resource2)
    input2.id = 'docA100'
    pdf.inputs << input2

    outline2 = pdf.out_lines.add('Outlines in Doc A 100')
    outline2.children.add_pdf_outlines(input2)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_OutlineFrominputidFromParent_Pdfoutput
    @name = 'OutlineFrominputidFromParent'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    input = PdfInput.new(resource)
    input.id = 'invoice'
    pdf.inputs << input

    resource1 = ImageResource.new("#{INPUT_PATH}CCITT_1.tif")
    input1 = ImageInput.new(resource1)
    input1.id = 'picture'
    pdf.inputs << input1

    resource2 = PdfResource.new("#{INPUT_PATH}MergeOutlineInput.pdf")
    input2 = PdfInput.new(resource2)
    input2.id = 'docA100'
    pdf.inputs << input2

    outline = pdf.out_lines.add('Invoice')
    action = GoToAction.new(input)
    outline.action = action

    outline1 = pdf.out_lines.add('Picture')
    action1 = GoToAction.new(input1)
    outline1.action = action1

    pdf.out_lines.add_pdf_outlines(input2)

    outline3 = pdf.out_lines.add('DynamicPDF is Cool!')
    action3 = UrlAction.new('https://www.dynamicpdf.com')
    action3.url = 'https://www.dynamicpdf.com'
    outline3.action = action3

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples6.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Outline_GotoAction_Pdfoutput
    @name = 'OutlineGoToAction'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}SinglePage.pdf")
    input1 = PdfInput.new(resource1)
    input1.id = '3'
    pdf.inputs << input1

    outline = pdf.out_lines.add('OutlineA')
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    link_to = GoToAction.new(input1)
    link_to.page_offset = -5
    link_to.page_zoom = PageZoom::FIT_PAGE

    outline.action = link_to

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples7.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Outline_KidsBlankPageGotoAction_Pdfoutput
    @name = 'OutlineKidsGoToAction'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    input = PdfInput.new(resource)
    input.id = '2'
    pdf.inputs << input

    outline = pdf.out_lines.add('OutlineA')
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    outline1 = outline.children.add('OutlineA1')
    outline1.color = RgbColor.blue
    link_to = GoToAction.new(input)
    link_to.page_offset = 3

    outline1.action = link_to

    outline2 = outline.children.add('OutlineA2')
    outline2.color = RgbColor.blue
    link_to2 = GoToAction.new(input, 5)

    outline2.action = link_to2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples8.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples8.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_OutlineSameLevel_Pdfoutput
    @name = 'OutlineSameLevel'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    input = PdfInput.new(resource)
    input.id = 'invoice'
    pdf.inputs << input

    outline = pdf.out_lines.add('Invoice')
    action = GoToAction.new(input)
    outline.action = action

    outline3 = pdf.out_lines.add('DynamicPDF is Cool!')
    action3 = UrlAction.new('https://www.dynamicpdf.com')
    action3.url = 'https://www.dynamicpdf.com'
    outline3.action = action3

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples9.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples9.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_OutlineSimple_Pdfoutput
    @name = 'OutlineSameLevel'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    input.id = 'document1'
    pdf.inputs << input

    outline3 = pdf.out_lines.add('OutlineA')
    outline3.expanded = true
    outline3.style = OutlineStyle::BOLD_ITALIC
    outline3.color = RgbColor.new(1, 0, 0)
    action3 = UrlAction.new('https://www.dynamicpdf.com')
    action3.url = 'https://www.dynamicpdf.com'
    outline3.action = action3

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples10.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples10.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_OutlineSimpleFromInputId_Pdfoutput
    @name = 'OutlineSimpleFromInputId'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}OutlineInput.pdf")
    input = PdfInput.new(resource)
    input.id = 'document1'
    pdf.inputs << input

    outline3 = pdf.out_lines.add('outlineroot')
    outline3.expanded = true
    outline3.style = OutlineStyle::ITALIC
    outline3.color = RgbColor.new(1, 0, 0)

    pdf.out_lines.add_pdf_outlines(input)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples11.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples11.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_OutlineSimpleFromInputId_Children_Pdfoutput
    @name = 'OutlineSimpleFromInputIdChildren'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}OutlineInput.pdf")
    input = PdfInput.new(resource)
    input.id = 'document1'
    pdf.inputs << input

    outline3 = pdf.out_lines.add('outlineroot')
    outline3.expanded = true
    outline3.style = OutlineStyle::BOLD
    outline3.color = RgbColor.red

    outline3.children.add_pdf_outlines(input)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples12.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples12.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Outlines_simplegoto_Pdfoutput
    @name = 'OutlineSimpleGoTo'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input1 = PdfInput.new(resource1)
    input1.id = 'document2'
    pdf.inputs << input1

    outline = pdf.out_lines.add('OutlineA', input1, -2, PageZoom::FIT_PAGE)
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples13.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples13.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Outlines_simplegoto_mulitiple_inputs_Pdfoutput
    @name = 'OutlineSimpleGoToMultipleInputs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    input = PdfInput.new(resource)
    input.id = 'document1'
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input1 = PdfInput.new(resource1)
    input1.id = 'document2'
    pdf.inputs << input1

    outline = pdf.out_lines.add('OutlineA')
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    link_to = GoToAction.new(input1)
    link_to.page_offset = -2
    link_to.page_zoom = PageZoom::FIT_PAGE

    outline.action = link_to

    outline2 = outline.children.add('Outline2A')
    outline2.color = RgbColor.blue
    outline2.style = OutlineStyle::BOLD
    outline2.expanded = true

    link_to1 = GoToAction.new(input1)
    link_to1.page_offset = 1
    link_to1.page_zoom = PageZoom::FIT_PAGE
    outline2.action = link_to1

    outline_a1 = pdf.out_lines.add('OutlineA1')
    outline_a1.color = RgbColor.red
    outline_a1.style = OutlineStyle::BOLD
    outline_a1.expanded = true

    link_to2 = GoToAction.new(input1)
    link_to2.page_offset = 10
    link_to2.page_zoom = PageZoom::FIT_PAGE

    outline_a1.action = link_to2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples14.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples14.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Outline_urlaction_Pdfoutput
    @name = 'OutlineUrlAction'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input

    outline3 = pdf.out_lines.add('OutlineA')
    outline3.expanded = true
    outline3.style = OutlineStyle::BOLD
    outline3.color = RgbColor.red

    link_to = UrlAction.new('https://www.dynamicpdf.com/')
    link_to.url = 'https://www.dynamicpdf.com/'

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples15.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples15.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Outlines_with_children_one_level_Pdfoutput
    @name = 'OutlineChildOneLevel'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    input = PdfInput.new(resource)
    input.id = 'document1'
    pdf.inputs << input

    outline = pdf.out_lines.add('Outline1')
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    outline1_a = outline.children.add('Outline1A')
    outline1_a.color = RgbColor.blue
    outline1_a.style = OutlineStyle::BOLD
    outline1_a.expanded = true

    outline1 = pdf.out_lines.add('Outline2')
    outline1.color = RgbColor.red
    outline1.style = OutlineStyle::BOLD
    outline1.expanded = true

    outline2_a = outline1.children.add('Outline2A')
    outline2_a.color = RgbColor.blue
    outline2_a.style = OutlineStyle::BOLD
    outline2_a.expanded = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples16.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples16.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_ChildrenFrominputIds_Pdfoutput
    @name = 'OutlineChildFromInputIds'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}EmptyPages.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    resource2 = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    input2 = PdfInput.new(resource2)
    input2.id = 'invoice'
    pdf.inputs << input2

    resource1 = PdfResource.new("#{INPUT_PATH}PdfOutlineInput.pdf")
    input1 = PdfInput.new(resource1)
    input1.id = 'outlineDoc1'
    pdf.inputs << input1

    resource3 = ImageResource.new("#{INPUT_PATH}CCITT_1.TIF")
    input3 = ImageInput.new(resource3)
    input3.id = 'cciti'
    pdf.inputs << input3

    outline = pdf.out_lines.add('Outline1')
    outline.color = RgbColor.red
    outline.style = OutlineStyle::BOLD
    outline.expanded = true

    outline1_a = outline.children.add('Outline1A')
    outline1_a.color = RgbColor.blue
    outline1_a.style = OutlineStyle::BOLD
    outline1_a.expanded = true

    outline1_a1 = outline1_a.children.add('Outline1A1')
    outline1_a1.color = RgbColor.green
    outline1_a1.style = OutlineStyle::BOLD
    outline1_a1.expanded = true

    outline1_a2 = outline1_a.children.add('Outline1A2')
    outline1_a2.color = RgbColor.green
    outline1_a2.style = OutlineStyle::BOLD
    outline1_a2.expanded = true
    link_to = GoToAction.new(input3)
    outline1_a2.action = link_to

    outline1_b = outline.children.add('Outline1B')
    outline1_b.color = RgbColor.red
    outline1_b.style = OutlineStyle::BOLD
    outline1_b.expanded = true

    outline2 = pdf.out_lines.add('Outline2')
    outline2.color = RgbColor.red
    outline2.style = OutlineStyle::BOLD
    outline2.expanded = true

    outline2_a = outline2.children.add('Outline2A')
    outline2_a.color = RgbColor.blue
    outline2_a.style = OutlineStyle::BOLD
    outline2_a.expanded = true

    outline2_a1 = outline2_a.children.add('Outline2A1')
    outline2_a1.color = RgbColor.green
    outline2_a1.style = OutlineStyle::BOLD
    outline2_a1.expanded = true

    outline2_a2 = outline2_a.children.add('Outline2A2')
    outline2_a2.color = RgbColor.green
    outline2_a2.style = OutlineStyle::BOLD
    outline2_a2.expanded = true

    outline2.children.add_pdf_outlines(input1)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlineSamples17.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineSamples17.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
