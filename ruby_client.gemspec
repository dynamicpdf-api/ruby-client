# frozen_string_literal: true

if File.exist?("./lib/ruby_client/version.rb")
  require_relative 'lib/ruby_client/version'
else
  require 'ruby_client/version'
end



Gem::Specification.new do |spec|
  spec.name          = 'dynamicpdf_api'
  spec.version       = RubyClient::VERSION
  spec.authors       = ['Dynamicpdf']
  spec.email         = ['info@dynamicpdf.com']

  spec.summary       = "A Ruby Client API that uses the DynamicPDF API to create, merge, split, form fill, stamp, secure/encrypt PDF documents and convert word/Excel files to PDF."
  spec.description   = "A Ruby Client API that uses the DynamicPDF API to create, merge, split, form fill, stamp, secure/encrypt PDF documents and convert word/Excel files to PDF."
  spec.homepage      = 'https://github.com/dynamicpdf-api/ruby-client'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  # spec.metadata["allowed_push_host"] = "Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/dynamicpdf-api/ruby-client'
  spec.metadata['changelog_uri'] = 'https://github.com/dynamicpdf-api/ruby-client/commits/main'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files            =  [
  "lib/ruby_client/version.rb",
  "lib/ruby_client/Action.rb",
  "lib/ruby_client/AdditionalResource.rb",
  "lib/ruby_client/AdditionalResourceType.rb",
  "lib/ruby_client/Aes128Security.rb",
  "lib/ruby_client/Aes256Security.rb",
  "lib/ruby_client/Align.rb",
  "lib/ruby_client/ButtonFieldInformation.rb",
  "lib/ruby_client/ButtonFieldType.rb",
  "lib/ruby_client/ChoiceFieldInformation.rb",
  "lib/ruby_client/ChoiceFieldType.rb",
  "lib/ruby_client/CmykColor.rb",
  "lib/ruby_client/Color.rb",
  "lib/ruby_client/ColorSpaceType.rb",
  "lib/ruby_client/ConverterInput.rb",
  "lib/ruby_client/DlexInput.rb",
  "lib/ruby_client/DlexLayout.rb",
  "lib/ruby_client/DlexResource.rb",
  "lib/ruby_client/EncryptDocumentComponents.rb",
  "lib/ruby_client/Endpoint.rb",
  "lib/ruby_client/EndPointException.rb",
  "lib/ruby_client/EndpointResource.rb",
  "lib/ruby_client/ExcelInput.rb",
  "lib/ruby_client/ExcelResource.rb",
  "lib/ruby_client/Font.rb",
  "lib/ruby_client/FontInformation.rb",
  "lib/ruby_client/FontResource.rb",
  "lib/ruby_client/FormField.rb",
  "lib/ruby_client/FormFieldInformation.rb",
  "lib/ruby_client/GoToAction.rb",
  "lib/ruby_client/Grayscale.rb",
  "lib/ruby_client/HtmlInput.rb",
  "lib/ruby_client/HtmlResource.rb",
  "lib/ruby_client/ImageInfo.rb",
  "lib/ruby_client/ImageInformation.rb",
  "lib/ruby_client/ImageInput.rb",
  "lib/ruby_client/ImageResource.rb",
  "lib/ruby_client/ImageResponse.rb",
  "lib/ruby_client/Input.rb",
  "lib/ruby_client/InputType.rb",
  "lib/ruby_client/JsonResponse.rb",
  "lib/ruby_client/LayoutDataResource.rb",
  "lib/ruby_client/LineStyle.rb",
  "lib/ruby_client/MergeOptions.rb",
  "lib/ruby_client/MultiSelectListBoxInformation.rb",
  "lib/ruby_client/Outline.rb",
  "lib/ruby_client/OutlineList.rb",
  "lib/ruby_client/OutlineStyle.rb",
  "lib/ruby_client/OutputSize.rb",
  "lib/ruby_client/PageInformation.rb",
  "lib/ruby_client/PageInput.rb",
  "lib/ruby_client/PageOrientation.rb",
  "lib/ruby_client/PageSize.rb",
  "lib/ruby_client/PageZoom.rb",
  "lib/ruby_client/Pdf.rb",
  "lib/ruby_client/PdfContent.rb",
  "lib/ruby_client/PdfInfo.rb",
  "lib/ruby_client/PdfInfoResponse.rb",
  "lib/ruby_client/PdfInformation.rb",
  "lib/ruby_client/PdfInput.rb",
  "lib/ruby_client/PdfInstructions.rb",
  "lib/ruby_client/PdfResource.rb",
  "lib/ruby_client/PdfResponse.rb",
  "lib/ruby_client/PdfText.rb",
  "lib/ruby_client/PdfTextResponse.rb",
  "lib/ruby_client/PdfXmp.rb",
  "lib/ruby_client/PushButtonInformation.rb",
  "lib/ruby_client/RC4128Security.rb",
  "lib/ruby_client/Resource.rb",
  "lib/ruby_client/ResourceType.rb",
  "lib/ruby_client/Response.rb",
  "lib/ruby_client/RgbColor.rb",
  "lib/ruby_client/Security.rb",
  "lib/ruby_client/SecurityType.rb",
  "lib/ruby_client/SignatureFieldInformation.rb",
  "lib/ruby_client/Template.rb",
  "lib/ruby_client/TextFieldInformation.rb",
  "lib/ruby_client/TextOrder.rb",
  "lib/ruby_client/TextReplace.rb",
  "lib/ruby_client/UnitConverter.rb",
  "lib/ruby_client/UrlAction.rb",
  "lib/ruby_client/VAlign.rb",
  "lib/ruby_client/WebColor.rb",
  "lib/ruby_client/WordInput.rb",
  "lib/ruby_client/WordResource.rb",
  "lib/ruby_client/XmlResponse.rb",
  "lib/ruby_client/Elements/AztecBarcodeElement.rb",
  "lib/ruby_client/Elements/AztecSymbolSize.rb",
  "lib/ruby_client/Elements/BarcodeElement.rb",
  "lib/ruby_client/Elements/Code11BarcodeElement.rb",
  "lib/ruby_client/Elements/Code128BarcodeElement.rb",
  "lib/ruby_client/Elements/Code25BarcodeElement.rb",
  "lib/ruby_client/Elements/Code39BarcodeElement.rb",
  "lib/ruby_client/Elements/Code93BarcodeElement.rb",
  "lib/ruby_client/Elements/Compaction.rb",
  "lib/ruby_client/Elements/DataMatrixBarcodeElement.rb",
  "lib/ruby_client/Elements/DataMatrixEncodingType.rb",
  "lib/ruby_client/Elements/DataMatrixFunctionCharacter.rb",
  "lib/ruby_client/Elements/DataMatrixSymbolSize.rb",
  "lib/ruby_client/Elements/Dim2BarcodeElement.rb",
  "lib/ruby_client/Elements/Element.rb",
  "lib/ruby_client/Elements/ElementPlacement.rb",
  "lib/ruby_client/Elements/ElementType.rb",
  "lib/ruby_client/Elements/ErrorCorrection.rb",
  "lib/ruby_client/Elements/Gs1DataBarBarcodeElement.rb",
  "lib/ruby_client/Elements/Gs1DataBarType.rb",
  "lib/ruby_client/Elements/Iata25BarcodeElement.rb",
  "lib/ruby_client/Elements/ImageElement.rb",
  "lib/ruby_client/Elements/LineElement.rb",
  "lib/ruby_client/Elements/MsiBarcodeCheckDigitMode.rb",
  "lib/ruby_client/Elements/MsiBarcodeElement.rb",
  "lib/ruby_client/Elements/PageNumberingElement.rb",
  "lib/ruby_client/Elements/Pdf417BarcodeElement.rb",
  "lib/ruby_client/Elements/QrCodeElement.rb",
  "lib/ruby_client/Elements/QrCodeFnc1.rb",
  "lib/ruby_client/Elements/RectangleElement.rb",
  "lib/ruby_client/Elements/StackedGs1DataBarBarcodeElement.rb",
  "lib/ruby_client/Elements/StackedGs1DataBarType.rb",
  "lib/ruby_client/Elements/TextBarcodeElement.rb",
  "lib/ruby_client/Elements/TextElement.rb",
  "lib/ruby_client/Elements/ValueType.rb",
  "lib/ruby_client/Imaging/ColorFormatType.rb",
  "lib/ruby_client/Imaging/CompressionType.rb",
  "lib/ruby_client/Imaging/DitheringAlgorithm.rb",
  "lib/ruby_client/Imaging/DpiImageSize.rb",
  "lib/ruby_client/Imaging/FixedImageSize.rb",
  "lib/ruby_client/Imaging/GifImageFormat.rb",
  "lib/ruby_client/Imaging/ImageFormat.rb",
  "lib/ruby_client/Imaging/ImageFormatType.rb",
  "lib/ruby_client/Imaging/ImageSize.rb",
  "lib/ruby_client/Imaging/ImageSizeType.rb",
  "lib/ruby_client/Imaging/ImageSizeUnit.rb",
  "lib/ruby_client/Imaging/JpegImageFormat.rb",
  "lib/ruby_client/Imaging/MaxImageSize.rb",
  "lib/ruby_client/Imaging/PercentageImageSize.rb",
  "lib/ruby_client/Imaging/PngColorFormat.rb",
  "lib/ruby_client/Imaging/PngImageFormat.rb",
  "lib/ruby_client/Imaging/PngIndexedColorFormat.rb",
  "lib/ruby_client/Imaging/PngMonochromeColorFormat.rb",
  "lib/ruby_client/Imaging/QuantizationAlgorithm.rb",
  "lib/ruby_client/Imaging/PdfImage.rb",
  "lib/ruby_client/Imaging/PdfImageResponse.rb",
  "lib/ruby_client/Imaging/TiffColorFormat.rb",
  "lib/ruby_client/Imaging/TiffImageFormat.rb",
  "lib/ruby_client/Imaging/TiffIndexedColorFormat.rb",
  "lib/ruby_client/Imaging/TiffMonochromeColorFormat.rb",
  "lib/ruby_client/Imaging/BmpColorFormat.rb",
  "lib/ruby_client/Imaging/BmpImageFormat.rb",
  "lib/ruby_client/Imaging/BmpMonochromeColorFormat.rb",
  "lib/ruby_client/Imaging/ColorFormat.rb",
  "lib/ruby_client.rb"]
  #spec.bindir        = "exe"
  #spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  #spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
