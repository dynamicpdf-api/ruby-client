require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class JpegImagingSampleTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL

  def get_imaging(response, outputName)
    for i in 0...response.images.length
      image = response.images[i]
      decoded_data = Base64.decode64(image.data)
      file_path = "#{OUTPUT_PATH}" + outputName + i.to_s + ".jpeg"

      File.open(file_path, 'wb') do |file|
        file.write(decoded_data)
      end
    end
  end

  def test_JpegImageFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_PageCount
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL
    pdfImage.start_page_number = 2
    pdfImage.page_count = 2
    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_PageCount_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_FixedSize_InPoint
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Point
    fixedImageSize.height = 500
    fixedImageSize.width = 500
    pdfImage.image_size = fixedImageSize

    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_FixedSize_InPoint_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_FixedSize_InMillimeter
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Millimeter
    fixedImageSize.height = 200
    fixedImageSize.width = 200
    pdfImage.image_size = fixedImageSize

    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_FixedSize_InMillimeter_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_FixedSize_InInch
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Inch
    fixedImageSize.height = 5
    fixedImageSize.width = 5
    pdfImage.image_size = fixedImageSize

    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_FixedSize_InInch_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_MaxSize_InPoint
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Point
    maxImageSize.max_height = 500
    maxImageSize.max_width = 500
    pdfImage.image_size =  maxImageSize

    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_MaxSize_InPoint_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_MaxSize_InInch
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Inch
    maxImageSize.max_height = 7
    maxImageSize.max_width = 7
    pdfImage.image_size =  maxImageSize

    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_MaxSize_InInch_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_MaxSize_InMillimeter
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Millimeter
    maxImageSize.max_height = 400
    maxImageSize.max_width = 400
    pdfImage.image_size =  maxImageSize

    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_MaxSize_InMillimeter_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_Dpi_ImageSize
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    dpiImageSize = DpiImageSize.new
    dpiImageSize.horizontal_dpi = 155
    dpiImageSize.vertical_dpi = 155
    pdfImage.image_size = dpiImageSize

    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_Dpi_ImageSize_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_Percentage_ImageSize
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    percentageImageSize = PercentageImageSize.new
    percentageImageSize.horizontal_percentage = 50
    percentageImageSize.vertical_percentage = 50
    pdfImage.image_size = percentageImageSize

    jpegImageFormat = JpegImageFormat.new
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_Percentage_ImageSize_")

    assert response.is_successful, response.error_message
  end

  def test_JpegImageFormat_Quality
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    jpegImageFormat = JpegImageFormat.new
    jpegImageFormat.quality = 10
    pdfImage.image_format = jpegImageFormat

    response = pdfImage.process()

    get_imaging(response, "JpegImageFormat_Quality_")

    assert response.is_successful, response.error_message
  end

end
