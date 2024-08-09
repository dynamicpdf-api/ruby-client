require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class BmpImagingSampleTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL

  def get_imaging(response, outputName)
    for i in 0...response.images.length
      image = response.images[i]
      decoded_data = Base64.decode64(image.data)
      file_path = "#{OUTPUT_PATH}" + outputName + i.to_s + ".bmp"

      File.open(file_path, 'wb') do |file|
        file.write(decoded_data)
      end
    end
  end

  def test_BmpImageFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_PageCount
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL
    pdfImage.start_page_number = 2
    pdfImage.page_count = 2
    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_PageCount_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_FixedSize_InPoint
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Point
    fixedImageSize.height = 500
    fixedImageSize.width = 500
    pdfImage.image_size = fixedImageSize

    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_FixedSize_InPoint_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_FixedSize_InMillimeter
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Millimeter
    fixedImageSize.height = 200
    fixedImageSize.width = 200
    pdfImage.image_size = fixedImageSize

    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_FixedSize_InMillimeter_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_FixedSize_InInch
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Inch
    fixedImageSize.height = 5
    fixedImageSize.width = 5
    pdfImage.image_size = fixedImageSize

    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_FixedSize_InInch_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_MaxSize_InPoint
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Point
    maxImageSize.max_height = 500
    maxImageSize.max_width = 500
    pdfImage.image_size =  maxImageSize

    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_MaxSize_InPoint_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_MaxSize_InInch
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Inch
    maxImageSize.max_height = 7
    maxImageSize.max_width = 7
    pdfImage.image_size =  maxImageSize

    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_MaxSize_InInch_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_MaxSize_InMillimeter
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Millimeter
    maxImageSize.max_height = 400
    maxImageSize.max_width = 400
    pdfImage.image_size =  maxImageSize

    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_MaxSize_InMillimeter_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_Dpi_ImageSize
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    dpiImageSize = DpiImageSize.new
    dpiImageSize.horizontal_dpi = 155
    dpiImageSize.vertical_dpi = 155
    pdfImage.image_size = dpiImageSize

    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_Dpi_ImageSize_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_Percentage_ImageSize
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    percentageImageSize = PercentageImageSize.new
    percentageImageSize.horizontal_percentage = 50
    percentageImageSize.vertical_percentage = 50
    pdfImage.image_size = percentageImageSize

    bmpImageFormat = BmpImageFormat.new
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_Percentage_ImageSize_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_Floyd_MonoChrome
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    bmpImageFormat = BmpImageFormat.new
    bmpMonoChromeColorFormat = BmpMonochromeColorFormat.new
    bmpMonoChromeColorFormat.dithering_algorithm = DitheringAlgorithm::FloydSteinberg
    bmpMonoChromeColorFormat.dithering_percent = 50
    bmpImageFormat.color_format = bmpMonoChromeColorFormat
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_Floyd_MonoChrome_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_Bayer_MonoChrome
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    bmpImageFormat = BmpImageFormat.new
    bmpMonoChromeColorFormat = BmpMonochromeColorFormat.new
    bmpMonoChromeColorFormat.dithering_algorithm = DitheringAlgorithm::Bayer
    bmpMonoChromeColorFormat.dithering_percent = 50
    bmpImageFormat.color_format = bmpMonoChromeColorFormat
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_Bayer_MonoChrome_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_RgbColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    bmpImageFormat = BmpImageFormat.new
    bmpImageFormat.color_format = BmpColorFormat.new(ColorFormatType::RGB)
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_RgbColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_RgbAColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    bmpImageFormat = BmpImageFormat.new
    bmpImageFormat.color_format = BmpColorFormat.new(ColorFormatType::RGBA)
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_RgbAColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_MonochromeColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    bmpImageFormat = BmpImageFormat.new
    bmpImageFormat.color_format = BmpColorFormat.new(ColorFormatType::Monochrome)
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_MonochromeColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_IndexedColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    bmpImageFormat = BmpImageFormat.new
    bmpImageFormat.color_format = BmpColorFormat.new(ColorFormatType::Indexed)
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_IndexedColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_GrayscaleColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    bmpImageFormat = BmpImageFormat.new
    bmpImageFormat.color_format = BmpColorFormat.new(ColorFormatType::Grayscale)
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_GrayscaleColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_BmpImageFormat_BlackThreshold
    resource = PdfResource.new("#{INPUT_PATH}Gray.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    bmpImageFormat = BmpImageFormat.new
    bmpMonoChromeColorFormat = BmpMonochromeColorFormat.new
    bmpMonoChromeColorFormat.black_threshold = 200
    bmpImageFormat.color_format = bmpMonoChromeColorFormat
    pdfImage.image_format = bmpImageFormat

    response = pdfImage.process()

    get_imaging(response, "BmpImageFormat_BlackThreshold_")

    assert response.is_successful, response.error_message
  end

end
