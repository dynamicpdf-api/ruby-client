require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

include DynamicPDFApi

class DlexInputSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_SimpleDlex_Pdfoutput
    @name = 'SimpleDlex_Pdfoutput'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    dlex = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex")
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    input = DlexInput.new(dlex, layout_data)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexInputSamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}DlexInputSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_SimpleDlex_Cloud_Pdfoutput
    @name = 'SimpleDlex_Cloud'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    input = DlexInput.new('SimpleReportWithCoverPage.dlex', layout_data)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexInputSamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}DlexInputSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_SimpleDlex_CloudData_Pdfoutput
    @name = 'SimpleDlex_CloudData'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = DlexInput.new('SimpleReportWithCoverPage.dlex', 'SimpleReportData.json')
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexInputSamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}DlexInputSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_Template_Pdfoutput
    @name = 'Template_Pdfoutput'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    dlex = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex")
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    input = DlexInput.new(dlex, layout_data)

    template = Template.new('temp1')
    text_element = TextElement.new('HelloWorld', ElementPlacement::TOP_RIGHT)
    template.elements << text_element
    input.set_template(template)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexInputSamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}DlexInputSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PagenumberingLabelWithTemplate_Pdfoutput
    @name = 'PagenumberingLabelWithTemplate'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    dlex = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex")
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    input = DlexInput.new(dlex, layout_data)

    template = Template.new('temp1')
    text_element = PageNumberingElement.new('%%CP%%', ElementPlacement::TOP_RIGHT)
    template.elements << text_element
    input.set_template(template)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexInputSamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}DlexInputSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_SimpleDlex_AddDlex_Pdfoutput
    @name = 'SimpleDlex_AddDlex'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    dlex = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex")
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    pdf.add_dlex(dlex, layout_data)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexInputSamples6.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}DlexInputSamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_SimpleDlex_AddDlexCloudResource_Pdfoutput
    @name = 'SimpleDlex_AddDlexCloud'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    pdf.add_dlex('SimpleReportWithCoverPage.dlex', layout_data)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexInputSamples7.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}DlexInputSamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_ImageURI_Pdfoutput
    @name = 'ImageURI_Pdfoutput'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    dlex = DlexResource.new("#{INPUT_PATH}dynamic-image.dlex")
    layout_data = LayoutDataResource.new("#{INPUT_PATH}ImageData.json")
    pdf.add_dlex(dlex, layout_data)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexImageURIoutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}DlexImageURIoutput.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
