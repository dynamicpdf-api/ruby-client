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
      File.open("#{OUTPUT_PATH}OutlineGoToAction_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineGoToAction_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_AddOutlinesForNewPdf
    @name = 'OutlinesForNewPdf'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = pdf.add_page
    page_input.elements << TextElement.new("Hello World 1", ElementPlacement::TOP_CENTER)

    page_input1 = pdf.add_page
    page_input1.elements << TextElement.new("Hello World 2", ElementPlacement::TOP_CENTER)

    page_input2 = pdf.add_page
    page_input2.elements << TextElement.new("Hello World 3", ElementPlacement::TOP_CENTER)

    root_outline = pdf.out_lines.add("Root Outline")
    root_outline.expanded = true

    root_outline.children.add("Page 1", page_input)
    root_outline.children.add("Page 2", page_input1)
    root_outline.children.add("Page 3", page_input2)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlinesForNewPdf_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlinesForNewPdf_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

def test_AddOutlinesForExistingPdf
    @name = 'OutlinesForExistingPdf'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource1 = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input1 = pdf.add_pdf(resource1)
    input1.id = 'DocumentA'

    resource2 = PdfResource.new("#{INPUT_PATH}InvoiceTemplate.pdf")
    input2 = pdf.add_pdf(resource2)
    input2.id = 'invoice'

    root_outline = pdf.out_lines.add("Root Outline")
    root_outline.expanded = true

    root_outline.children.add("DocumentA 100",input1,0,PageZoom::FIT_PAGE)
    root_outline.children.add("Invoice",input2)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}OutlinesForExsistingPdf_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlinesForExsistingPdf_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

def test_MergeExsistingOutlinesWithRootoutline
    @name = 'ImportOutlines'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource1 = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input1 = pdf.add_pdf(resource1)
    input1.id = 'AllPageElements'

    resource2 = PdfResource.new("#{INPUT_PATH}PdfOutlineInput.pdf")
    input2 = pdf.add_pdf(resource2)
    input2.id = 'outlineDoc1'

    root_outline = pdf.out_lines.add("Imported Outline")
    root_outline.expanded = true

    root_outline.children.add_pdf_outlines(input1)
    root_outline.children.add(input2)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImportOutlines_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImportOutlines_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

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
      File.open("#{OUTPUT_PATH}OutlineUrlAction_PdfOutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}OutlineUrlAction_JsonOutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
