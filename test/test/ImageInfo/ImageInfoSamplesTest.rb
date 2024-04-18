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

  def test_Tiff_JsonOutput
    @name = 'Tiff'

    resource = ImageResource.new("#{INPUT_PATH}Output.tiff")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples1.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Group4Fax_JsonOutput
    @name = 'Group4Fax'

    resource = ImageResource.new("#{INPUT_PATH}CCITT_1.tif")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples2.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Gif_JsonOutput
    @name = 'Gif'

    resource = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples3.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Png_JsonOutput
    @name = 'Png'

    resource = ImageResource.new("#{INPUT_PATH}170x220_T.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples4.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Bmp_JsonOutput
    @name = 'Bmp'

    resource = ImageResource.new("#{INPUT_PATH}Earth2.bmp")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples5.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Jpg_JsonOutput
    @name = 'Jpg'

    resource = ImageResource.new("#{INPUT_PATH}Image1.jpg")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples6.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

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
        File.open("#{OUTPUT_PATH}ImageInfoSamples7#{i}.json", 'wb') { |file| file.write(response.json_content) }
      end
    end

    assert response.is_successful, response.error_message
  end

  def test_Group3Fax_JsonOutput
    @name = 'Group3Fax'

    resource = ImageResource.new("#{INPUT_PATH}FaxTest.tif")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples8.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_JpegTiff_JsonOutput
    @name = 'JpegTiff'

    resource = ImageResource.new("#{INPUT_PATH}2 page Color.tif")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples9.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_LzwTiff_JsonOutput
    @name = 'LzwTiff'

    resource = ImageResource.new("#{INPUT_PATH}2.tif")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples10.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_UnCompressedTiff_JsonOutput
    @name = 'UnCompressedTiff'

    resource = ImageResource.new("#{INPUT_PATH}16UnCompressedCMYKMM.tif")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples11.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Indexed_Bmp_JsonOutput
    @name = 'Indexed_Bmp'

    resource = ImageResource.new("#{INPUT_PATH}3_rescale_indexed.bmp")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples12.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test__2Bpp_Png_JsonOutput
    @name = '2Bpp_Png'

    resource = ImageResource.new("#{INPUT_PATH}121_2bpp.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples13.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test__4Bpp_Png_JsonOutput
    @name = '4Bpp_Png'

    resource = ImageResource.new("#{INPUT_PATH}4bpp.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples14.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Rgba_Png_JsonOutput
    @name = 'Rgba_Png'

    resource = ImageResource.new("#{INPUT_PATH}Animated_PNG_example_bouncing_beach_ball.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples15.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Interlaced_Png_JsonOutput
    @name = 'Interlaced_Png'

    resource = ImageResource.new("#{INPUT_PATH}cat.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples16.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_GrayScale_Png_JsonOutput
    @name = 'GrayScale_Png'

    resource = ImageResource.new("#{INPUT_PATH}error.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples17.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_GrayScaleAlpha_Png_JsonOutput
    @name = 'GrayScaleAlpha_Png'

    resource = ImageResource.new("#{INPUT_PATH}gray8a.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples18.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_GrayScaleAlpha16Bit_Png_JsonOutput
    @name = 'GrayScaleAlpha16Bit_Png'

    resource = ImageResource.new("#{INPUT_PATH}gray16a.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples19.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Rgba16Bit_Png_JsonOutput
    @name = 'Rgba16Bit_Png'

    resource = ImageResource.new("#{INPUT_PATH}rgba16.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples20.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end

  def test_Indexed_Png_JsonOutput
    @name = 'Indexed_Png'

    resource = ImageResource.new("#{INPUT_PATH}png2.png")

    pdf_end_point = ImageInfo.new(resource)
    pdf_end_point.api_key = KEY
    pdf_end_point.base_url = URL

    response = pdf_end_point.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInfoSamples21.json", 'wb') { |file| file.write(response.json_content) }
    end

    assert response.is_successful, response.error_message
  end
end
