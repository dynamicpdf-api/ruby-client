require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'


class ImageInfoSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_MultipleFormats_JsonOutput
    @name = 'MultipleFormat'

    images = ['Output.tiff', 'Northwind Logo.gif', 'CCITT_1.tif', '170x220_T.png', 'Image1.jpg', 'Earth2.bmp']
    response = nil
    (0..(images.length - 1)).each do |i|
      resource = ImageResource.new(INPUT_PATH + images[i])

      pdf_end_point = ImageInfo.new(resource)
      pdf_end_point.api_key = KEY
      pdf_end_point.base_url = URL

      response = pdf_end_point.process

      if response.is_successful
        File.open("#{OUTPUT_PATH}MultipleFormat_JsonOutput_#{i}.json", 'wb') { |file| file.write(response.json_content) }
      end
    end

    assert response.is_successful, response.error_message
  end

end
