﻿require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class HtmlInputSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_HtmlString_pdfoutput
    @name = "HtmlToPdf"
    pdf = Pdf.new()
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    html_resource = HtmlResource.new("<html><body>hello</body></html>")
    html = HtmlInput.new(html_resource)

    html.page_width = 300
    html.page_height = 200

    html.top_margin = 10
    html.bottom_margin = 10
    html.right_margin = 40
    html.left_margin = 40

    pdf.inputs << html
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}HtmlInputSamples1.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}HtmlInputSamples1.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_HtmlStringParameters_pdfoutput
    @name = "HtmlToPdf"
    pdf = Pdf.new()
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    html_resource = HtmlResource.new("<html><body>hello</body></html>")
    html = HtmlInput.new(html_resource, nil, PageSize::LETTER, PageOrientation::PORTRAIT, 10)

    pdf.inputs << html
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}HtmlInputSamples2.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}HtmlInputSamples2.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_HtmlResource_pdfoutput
    @name = "HtmlToPdf"
    pdf = Pdf.new()
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    html_string = File.open("#{INPUT_PATH}html.html", "rb")
    file = HtmlResource.new(html_string)

    html = HtmlInput.new(file)
    html.page_size = PageSize::B4
    html.page_orientation = PageOrientation::LANDSCAPE

    html.top_margin = 50
    html.bottom_margin = 50
    html.right_margin = 80
    html.left_margin = 80

    pdf.inputs << html
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}HtmlInputSamples3.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}HtmlInputSamples3.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_HtmlResourcePageSize_pdfoutput
    @name = "HtmlToPdf"
    pdf = Pdf.new()
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    html_string = File.open("#{INPUT_PATH}html.html", "rb")
    file = HtmlResource.new(html_string)

    html = HtmlInput.new(file)
    html.page_size = PageSize::POSTCARD

    pdf.inputs << html
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}HtmlInputSamples4.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}HtmlInputSamples4.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_HtmlResourcePageHeightPageWidth_pdfoutput
    @name = "HtmlToPdf"
    pdf = Pdf.new()
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    html_string = File.open("#{INPUT_PATH}html.html", "rb")
    file = HtmlResource.new(html_string)

    html = HtmlInput.new(file)
    html.page_height = 400
    html.page_width = 300

    pdf.inputs << html
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}HtmlInputSamples5.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}HtmlInputSamples5.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_HtmlResourceParameters_pdfoutput
    @name = "HtmlToPdf"
    pdf = Pdf.new()
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    html_string = File.open("#{INPUT_PATH}html.html", "rb")
    file = HtmlResource.new(html_string)

    html = HtmlInput.new(file, nil, PageSize::A3, PageOrientation::LANDSCAPE, 30)

    pdf.inputs << html
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}HtmlInputSamples6.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}HtmlInputSamples6.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
