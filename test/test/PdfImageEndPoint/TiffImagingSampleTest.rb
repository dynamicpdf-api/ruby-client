require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class TiffImagingSampleTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL

  def get_imaging(response, outputName)
    for i in 0...response.images.length
      image = response.images[i]
      decoded_data = Base64.decode64(image.data)
      file_path = "#{OUTPUT_PATH}" + outputName + i.to_s + ".tiff"

      File.open(file_path, 'wb') do |file|
        file.write(decoded_data)
      end
    end
  end

  def test_TiffImageFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_PageCount
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL
    pdfImage.start_page_number = 2
    pdfImage.page_count = 2
    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_PageCount_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_FixedSize_InPoint
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Point
    fixedImageSize.height = 500
    fixedImageSize.width = 500
    pdfImage.image_size = fixedImageSize

    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_FixedSize_InPoint_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_FixedSize_InMillimeter
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Millimeter
    fixedImageSize.height = 200
    fixedImageSize.width = 200
    pdfImage.image_size = fixedImageSize

    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_FixedSize_InMillimeter_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_FixedSize_InInch
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    fixedImageSize = FixedImageSize.new
    fixedImageSize.unit = ImageSizeUnit::Inch
    fixedImageSize.height = 5
    fixedImageSize.width = 5
    pdfImage.image_size = fixedImageSize

    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_FixedSize_InInch_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_MaxSize_InPoint
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Point
    maxImageSize.max_height = 500
    maxImageSize.max_width = 500
    pdfImage.image_size =  maxImageSize

    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_MaxSize_InPoint_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_MaxSize_InInch
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Inch
    maxImageSize.max_height = 7
    maxImageSize.max_width = 7
    pdfImage.image_size =  maxImageSize

    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_MaxSize_InInch_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_MaxSize_InMillimeter
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    maxImageSize = MaxImageSize.new
    maxImageSize.unit = ImageSizeUnit::Millimeter
    maxImageSize.max_height = 400
    maxImageSize.max_width = 400
    pdfImage.image_size =  maxImageSize

    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_MaxSize_InMillimeter_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Dpi_ImageSize
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    dpiImageSize = DpiImageSize.new
    dpiImageSize.horizontal_dpi = 155
    dpiImageSize.vertical_dpi = 155
    pdfImage.image_size = dpiImageSize

    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Dpi_ImageSize_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Percentage_ImageSize
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    percentageImageSize = PercentageImageSize.new
    percentageImageSize.horizontal_percentage = 50
    percentageImageSize.vertical_percentage = 50
    pdfImage.image_size = percentageImageSize

    tiffImageFormat = TiffImageFormat.new
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Percentage_ImageSize_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Floyd_MonoChrome
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffMonoChromeColorFormat = TiffMonochromeColorFormat.new
    tiffMonoChromeColorFormat.dithering_algorithm = DitheringAlgorithm::FloydSteinberg
    tiffMonoChromeColorFormat.dithering_percent = 50
    tiffImageFormat.color_format = tiffMonoChromeColorFormat
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Floyd_MonoChrome_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Bayer_MonoChrome
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffMonoChromeColorFormat = TiffMonochromeColorFormat.new
    tiffMonoChromeColorFormat.dithering_algorithm = DitheringAlgorithm::Bayer
    tiffMonoChromeColorFormat.dithering_percent = 50
    tiffImageFormat.color_format = tiffMonoChromeColorFormat
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Bayer_MonoChrome_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Floyd_Indexed
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffIndexedColorFormat = TiffIndexedColorFormat.new
    tiffIndexedColorFormat.dithering_algorithm = DitheringAlgorithm::FloydSteinberg
    tiffIndexedColorFormat.dithering_percent = 50
    tiffImageFormat.color_format = tiffIndexedColorFormat
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Floyd_Indexed_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Bayer_Indexed
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffIndexedColorFormat = TiffIndexedColorFormat.new
    tiffIndexedColorFormat.dithering_algorithm = DitheringAlgorithm::Bayer
    tiffIndexedColorFormat.dithering_percent = 50
    tiffImageFormat.color_format = tiffIndexedColorFormat
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Bayer_Indexed_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Qa_Octree
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffIndexedColorFormat = TiffIndexedColorFormat.new
    tiffIndexedColorFormat.quantization_algorithm = QuantizationAlgorithm::Octree
    tiffImageFormat.color_format = tiffIndexedColorFormat
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Qa_Octree_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Qa_WebSafe
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffIndexedColorFormat = TiffIndexedColorFormat.new
    tiffIndexedColorFormat.quantization_algorithm = QuantizationAlgorithm::WebSafe
    tiffImageFormat.color_format = tiffIndexedColorFormat
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Qa_WebSafe_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Qa_Werner
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffIndexedColorFormat = TiffIndexedColorFormat.new
    tiffIndexedColorFormat.quantization_algorithm = QuantizationAlgorithm::Werner
    tiffImageFormat.color_format = tiffIndexedColorFormat
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Qa_Werner_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_Qa_WU
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffIndexedColorFormat = TiffIndexedColorFormat.new
    tiffIndexedColorFormat.quantization_algorithm = QuantizationAlgorithm::WU
    tiffImageFormat.color_format = tiffIndexedColorFormat
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_Qa_WU_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_RgbColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffImageFormat.color_format = TiffColorFormat.new(ColorFormatType::RGB)
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_RgbColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_RgbAColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffImageFormat.color_format = TiffColorFormat.new(ColorFormatType::RGBA)
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_RgbAColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_MonochromeColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffImageFormat.color_format = TiffColorFormat.new(ColorFormatType::Monochrome)
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_MonochromeColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_IndexedColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffImageFormat.color_format = TiffColorFormat.new(ColorFormatType::Indexed)
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_IndexedColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_GrayscaleColorFormat
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffImageFormat.color_format = TiffColorFormat.new(ColorFormatType::Grayscale)
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_GrayscaleColorFormat_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_BlackThreshold
    resource = PdfResource.new("#{INPUT_PATH}Gray.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffMonoChromeColorFormat = TiffMonochromeColorFormat.new
    tiffMonoChromeColorFormat.black_threshold = 200
    tiffImageFormat.color_format = tiffMonoChromeColorFormat
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_BlackThreshold_")

    assert response.is_successful, response.error_message
  end

  def test_TiffImageFormat_MultiPage
    resource = PdfResource.new("#{INPUT_PATH}DocumentA.pdf")
    pdfImage = PdfImage.new(resource)
    pdfImage.api_key = KEY
    pdfImage.base_url = URL

    tiffImageFormat = TiffImageFormat.new
    tiffImageFormat.multi_page = true
    pdfImage.image_format = tiffImageFormat

    response = pdfImage.process()

    get_imaging(response, "TiffImageFormat_MultiPage_")

    assert response.is_successful, response.error_message
  end

end
