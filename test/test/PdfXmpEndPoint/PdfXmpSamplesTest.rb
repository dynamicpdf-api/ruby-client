require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'


class PdfXmpSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_XmpSingleResource
    @name = 'XmpSingelResource'

    resource = PdfResource.new("#{INPUT_PATH}bab6c782-2e85-4c6a-b248-9518a06549e900000.pdf")
    xmp = PdfXmp.new(resource)
    xmp.api_key = KEY
    xmp.base_url = URL

    response = xmp.process

    File.open("#{OUTPUT_PATH}Output1.xml", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_XmpSingleResource1
    @name = 'XmpSingleResource1'

    resource = PdfResource.new("#{INPUT_PATH}aaa_crash.pdf")

    xmp = PdfXmp.new(resource)
    xmp.api_key = KEY
    xmp.base_url = URL

    response = xmp.process

    File.open("#{OUTPUT_PATH}Output2.xml", 'wb') { |file| file.write(response.content) } if response.is_successful

    assert response.is_successful, response.error_message
  end

  def test_XmpMulitipleResource
    @name = 'XmpMulitipleResource'

    pdfs = ['aaa_crash.pdf', 'bab6c782-2e85-4c6a-b248-9518a06549e900000.pdf', 'COR-GEN-2455447-1-A-1.pdf',
            'Waiver TX AF.PDF']
    response = nil
    (0..(pdfs.length - 1)).each do |i|
      resource = PdfResource.new(INPUT_PATH + pdfs[i])
      xmp = PdfXmp.new(resource)
      xmp.api_key = KEY
      xmp.base_url = URL

      response = xmp.process

      if response.is_successful
        File.open("#{OUTPUT_PATH}Output3_#{i}.xml", 'wb') { |file| file.write(response.content) }
      end
    end

    assert response.is_successful, response.error_message
  end
end
