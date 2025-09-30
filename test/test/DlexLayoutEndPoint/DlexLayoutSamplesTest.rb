require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'
require_relative  './InvoiceData'

class DlexLayoutSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_DlexLayout
    @name = 'Simple'
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    dlex_endpoint = DlexLayout.new('SimpleReportWithCoverPage.dlex', layout_data)
    dlex_endpoint.api_key = KEY
    dlex_endpoint.base_url = URL

    response = dlex_endpoint.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexLayout.pdf", 'wb') { |file| file.write(response.content) }
    end
    assert response.is_successful, response.error_message
  end

  def test_InvoiceData_Pdfoutput
    @name = 'InvoiceData'
    invoice_data = InvoiceData.new
    invoice_linq_data = invoice_data.Order11077
    layout_data_resource = LayoutDataResource.new(invoice_linq_data)
    dlex_endpoint = DlexLayout.new('InvoiceOrderId.dlex', layout_data_resource)
    dlex_endpoint.api_key = KEY
    dlex_endpoint.base_url = URL

    response = dlex_endpoint.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}InvoiceData_Pdfoutput.pdf", 'wb') { |file| file.write(response.content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_DlexLayout_with_resource
    @name = 'DlexWithResource'
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    dlex_resource = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex", 'SimpleReportWithCoverPage.dlex')
    dlex_endpoint = DlexLayout.new(dlex_resource, layout_data)
    dlex_endpoint.add_additional_resource("#{INPUT_PATH}Northwind Logo.gif", 'Northwind Logo.gif')
    dlex_endpoint.api_key = KEY
    dlex_endpoint.base_url = URL

    response = dlex_endpoint.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexLayoutWithResource.pdf", 'wb') { |file| file.write(response.content) }
    end
    assert response.is_successful, response.error_message
  end

  def test_DlexLayout_with_resource_date
    @name = 'DlexWithResourceData'
    layout_data = LayoutDataResource.new("#{INPUT_PATH}SimpleReportData.json")
    dlex_resource = DlexResource.new("#{INPUT_PATH}SimpleReportWithCoverPage.dlex", 'SimpleReportWithCoverPage.dlex')
    dlex_endpoint = DlexLayout.new(dlex_resource, layout_data)
    file = File.open("#{INPUT_PATH}Northwind Logo.gif", 'rb')
    resource_data = file.read.unpack('C*')
    dlex_endpoint.add_additional_resource_with_resourcedata(resource_data, AdditionalResourceType::IMAGE, 'Northwind Logo.gif')
    dlex_endpoint.api_key = KEY
    dlex_endpoint.base_url = URL

    response = dlex_endpoint.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexWithResourceData.pdf", 'wb') { |file| file.write(response.content) }
    end
    assert response.is_successful, response.error_message
  end

  def test_DlexLayout_with_global_font
    @name = 'DlexWithGlobalFont'
    layout_data = LayoutDataResource.new("#{INPUT_PATH}Test.json")
    dlex_resource = DlexResource.new("#{INPUT_PATH}Test.dlex", 'SimpleReportWithCoverPage.dlex')
    dlex_endpoint = DlexLayout.new(dlex_resource, layout_data)
    dlex_endpoint.api_key = KEY
    dlex_endpoint.base_url = URL

    response = dlex_endpoint.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}DlexWithGlobalFont.pdf", 'wb') { |file| file.write(response.content) }
    end
    assert response.is_successful, response.error_message
  end
end
