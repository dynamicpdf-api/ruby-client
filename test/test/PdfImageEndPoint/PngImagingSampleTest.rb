require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class PngImagingSampleTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL

  def get_imaging(response, outputName)
    for i in 0...response.images.length
      image = response.images[i]
      decoded_data = Base64.decode64(image.data)
      file_path = "#{OUTPUT_PATH}" + outputName + i.to_s + ".png"

      File.open(file_path, 'wb') do |file|
        file.write(decoded_data)
      end
    end
  end

  def test_PngImageFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_PageCount
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL
    pdfImage.start_page_number = 2
    pdfImage.page_count = 2
    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_PageCount_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_FixedSize_InPoint
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Point
    fixedImageSize.height = 500
    fixedImageSize.width = 500
    pdfImage.image_size = fixedImageSize

    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_FixedSize_InPoint_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_FixedSize_InMillimeter
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Millimeter
    fixedImageSize.height = 200
    fixedImageSize.width = 200
    pdfImage.image_size = fixedImageSize

    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_FixedSize_InMillimeter_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_FixedSize_InInch
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Inch
    fixedImageSize.height = 5
    fixedImageSize.width = 5
    pdfImage.image_size = fixedImageSize

    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_FixedSize_InInch_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_MaxSize_InPoint
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Point
    maxImageSize.max_height = 500
    maxImageSize.max_width = 500
    pdfImage.image_size =  maxImageSize

    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_MaxSize_InPoint_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_MaxSize_InInch
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Inch
    maxImageSize.max_height = 7
    maxImageSize.max_width = 7
    pdfImage.image_size =  maxImageSize

    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_MaxSize_InInch_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_MaxSize_InMillimeter
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Millimeter
    maxImageSize.max_height = 400
    maxImageSize.max_width = 400
    pdfImage.image_size =  maxImageSize

    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_MaxSize_InMillimeter_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Dpi_ImageSize
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    dpiImageSize = DpiImageSize.new
    dpiImageSize.horizontal_dpi = 155
    dpiImageSize.vertical_dpi = 155
    pdfImage.image_size = dpiImageSize

    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Dpi_ImageSize_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Percentage_ImageSize
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    percentageImageSize = PercentageImageSize.new
    percentageImageSize.horizontal_percentage = 50
    percentageImageSize.vertical_percentage = 50
    pdfImage.image_size = percentageImageSize

    pngImageFormat = PngImageFormat.new
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Percentage_ImageSize_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Floyd_MonoChrome
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngMonoChromeColorFormat = PngMonochromeColorFormat.new
    pngMonoChromeColorFormat.dithering_algorithm = DitheringAlgorithm::FloydSteinberg
    pngMonoChromeColorFormat.dithering_percent = 50
    pngImageFormat.color_format = pngMonoChromeColorFormat
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Floyd_MonoChrome_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Bayer_MonoChrome
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngMonoChromeColorFormat = PngMonochromeColorFormat.new
    pngMonoChromeColorFormat.dithering_algorithm = DitheringAlgorithm::Bayer
    pngMonoChromeColorFormat.dithering_percent = 50
    pngImageFormat.color_format = pngMonoChromeColorFormat
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Bayer_MonoChrome_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Floyd_Indexed
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngIndexedColorFormat = PngIndexedColorFormat.new
    pngIndexedColorFormat.dithering_algorithm = DitheringAlgorithm::FloydSteinberg
    pngIndexedColorFormat.dithering_percent = 50
    pngImageFormat.color_format = pngIndexedColorFormat
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Floyd_Indexed_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Bayer_Indexed
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngIndexedColorFormat = PngIndexedColorFormat.new
    pngIndexedColorFormat.dithering_algorithm = DitheringAlgorithm::Bayer
    pngIndexedColorFormat.dithering_percent = 50
    pngImageFormat.color_format = pngIndexedColorFormat
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Bayer_Indexed_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Qa_Octree
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngIndexedColorFormat = PngIndexedColorFormat.new
    pngIndexedColorFormat.quantization_algorithm = QuantizationAlgorithm::Octree
    pngImageFormat.color_format = pngIndexedColorFormat
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Qa_Octree_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Qa_WebSafe
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngIndexedColorFormat = PngIndexedColorFormat.new
    pngIndexedColorFormat.quantization_algorithm = QuantizationAlgorithm::WebSafe
    pngImageFormat.color_format = pngIndexedColorFormat
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Qa_WebSafe_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Qa_Werner
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngIndexedColorFormat = PngIndexedColorFormat.new
    pngIndexedColorFormat.quantization_algorithm = QuantizationAlgorithm::Werner
    pngImageFormat.color_format = pngIndexedColorFormat
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Qa_Werner_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_Qa_WU
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngIndexedColorFormat = PngIndexedColorFormat.new
    pngIndexedColorFormat.quantization_algorithm = QuantizationAlgorithm::WU
    pngImageFormat.color_format = pngIndexedColorFormat
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_Qa_WU_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_RgbColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngImageFormat.color_format = PngColorFormat.new(ColorFormatType::RGB)
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_RgbColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_RgbAColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngImageFormat.color_format = PngColorFormat.new(ColorFormatType::RGBA)
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_RgbAColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_MonochromeColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngImageFormat.color_format = PngColorFormat.new(ColorFormatType::Monochrome)
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_MonochromeColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_IndexedColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngImageFormat.color_format = PngColorFormat.new(ColorFormatType::Indexed)
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_IndexedColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_GrayscaleColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngImageFormat.color_format = PngColorFormat.new(ColorFormatType::Grayscale)
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_GrayscaleColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_PngImageFormat_BlackThreshold
    resource = PdfResource.new("#{INPUT_PATH}Gray.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    pngImageFormat = PngImageFormat.new
    pngMonoChromeColorFormat = PngMonochromeColorFormat.new
    pngMonoChromeColorFormat.black_threshold = 200
    pngImageFormat.color_format = pngMonoChromeColorFormat
    pdfImage.image_format = pngImageFormat

    response = pdfImage.process()

    get_imaging(response, "PngImageFormat_BlackThreshold_")

    assert response.is_successful, response.error_message
  end

end
