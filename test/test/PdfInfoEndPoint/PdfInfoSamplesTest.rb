require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'


class PdfInfoSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_AllFormFields_JsonOutput
    @name = 'AllFormFields'

    resource = PdfResource.new("#{INPUT_PATH}AllFormFields.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output1.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_Button_JsonOutput
    @name = 'Button'

    resource = PdfResource.new("#{INPUT_PATH}Button.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output2.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_Checkbox_JsonOutput
    @name = 'Checkbox'

    resource = PdfResource.new("#{INPUT_PATH}Checkbox.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output3.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_Combo_JsonOutput
    @name = 'Combo'

    resource = PdfResource.new("#{INPUT_PATH}Checkbox.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output4.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_ComboExport_JsonOutput
    @name = 'ComboExport'

    resource = PdfResource.new("#{INPUT_PATH}ComboExport.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output5.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_ComboExport1_JsonOutput
    @name = 'ComboExport1'

    resource = PdfResource.new("#{INPUT_PATH}ComboExport1.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output6.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_ComboExport2_JsonOutput
    @name = 'ComboExport2'

    resource = PdfResource.new("#{INPUT_PATH}ComboExport2.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output7.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_ListBoxMultiSelect_JsonOutput
    @name = 'ListBoxMultiSelect'

    resource = PdfResource.new("#{INPUT_PATH}ListBoxMultiSelect.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output8.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_ListBoxSingleSelect_JsonOutput
    @name = 'ListBoxSingleSelect'

    resource = PdfResource.new("#{INPUT_PATH}ListBoxSingleSelect.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output9.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_ListMultiSelectExport1_JsonOutput
    @name = 'ListMultiSelectExport1'

    resource = PdfResource.new("#{INPUT_PATH}ListMultiSelectExport1.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output10.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_ListMultiSelectExport2_JsonOutput
    @name = 'ListMultiSelectExport2'

    resource = PdfResource.new("#{INPUT_PATH}ListMultiSelectExport2.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output11.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_PushButton_JsonOutput
    @name = 'PushButton'

    resource = PdfResource.new("#{INPUT_PATH}PushButton.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output12.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_Radio_JsonOutput
    @name = 'Radio'

    resource = PdfResource.new("#{INPUT_PATH}Radio.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output13.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_Signature_JsonOutput
    @name = 'Signature'

    resource = PdfResource.new("#{INPUT_PATH}Signature.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output14.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_SignatureNoSign_JsonOutput
    @name = 'SignatureNoSign'

    resource = PdfResource.new("#{INPUT_PATH}SignatureNoSign.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output15.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_TextField_JsonOutput
    @name = 'TextField'

    resource = PdfResource.new("#{INPUT_PATH}TextField.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output16.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_TextField2_JsonOutput
    @name = 'TextField2'

    resource = PdfResource.new("#{INPUT_PATH}TextField2.pdf")

    pdf_info = PdfInfo.new(resource)
    pdf_info.api_key = KEY
    pdf_info.base_url = URL

    response = pdf_info.process

    File.open("#{OUTPUT_PATH}Output17.json", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end
end
