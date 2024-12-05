# frozen_string_literal: true

require_relative "test_helper"
require_relative "TestParameters"
require_relative 'test\Complex\ComplexSamplesTest'
require_relative 'test\DlexLayoutEndPoint\DlexLayoutSamplesTest'
require_relative 'test\GeneralTestCases\FormFillTest'
require_relative 'test\GeneralTestCases\ImageToPdfTest'
require_relative 'test\GeneralTestCases\MergeTest'
require_relative 'test\GeneralTestCases\SecurityTest'
require_relative 'test\ImageInfo\ImageInfoSamplesTest'
require_relative 'test\PdfEndpoint\ColorPatternSamplesTest'
require_relative 'test\PdfEndpoint\DlexInputSamplesTest'
require_relative 'test\PdfEndpoint\FontSamplesTest'
require_relative 'test\PdfEndpoint\FormFillingSamplesTest'
require_relative 'test\PdfEndpoint\FormFlattenAndRemoveSamplesTest'
require_relative 'test\PdfEndpoint\ImageElementSamplesTest'
require_relative 'test\PdfEndpoint\ImageInputSamplesTest'
require_relative 'test\PdfEndpoint\LineSampleTest'
require_relative 'test\PdfEndpoint\OutlineSamplesTest'
require_relative 'test\PdfEndpoint\PageInputSamplesTest'
require_relative 'test\PdfEndpoint\PdfInputSamplesTest'
require_relative 'test\PdfEndpoint\RectangleSamplesTest'
require_relative 'test\PdfEndpoint\SecuritySamplesTest'
require_relative 'test\PdfEndpoint\TemplateBarcodeSamplesTest'
require_relative 'test\PdfEndpoint\TemplatePagenumberingSamplesTest'
require_relative 'test\PdfEndpoint\TemplateSamplesTest'
require_relative 'test\PdfEndpoint\HtmlInputSamplesTest'
require_relative 'test\PdfEndpoint\WordInputSamplesTest'
require_relative 'test\PdfEndpoint\ExcelInputSamplesTest'
require_relative 'test\PdfInfoEndPoint\PdfInfoSamplesTest'
require_relative 'test\PdfTextEndPoint\PdfTextSamplesTest'
require_relative 'test\PdfXmpEndPoint\PdfXmpSamplesTest'
require_relative 'test\PdfImageEndPoint\BmpImagingSampleTest'
require_relative 'test\PdfImageEndPoint\GifImagingSampleTest'
require_relative 'test\PdfImageEndPoint\JpegImagingSampleTest'
require_relative 'test\PdfImageEndPoint\PngImagingSampleTest'
require_relative 'test\PdfImageEndPoint\TiffImagingSampleTest'

class RubyClientTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RubyClient::VERSION
  end
end
