require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

include DynamicPDFApi

class ImageInputSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_FilePathTiffImage_Pdfoutput
    @name = 'FilePathTiffImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}CCITT_1.tif")
    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamTiffImage_Pdfoutput
    @name = 'StreamTiffImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}CCITT_1.tif", 'rb')
    resource = ImageResource.new(file)
    file.close

    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesTiffImage_Pdfoutput
    @name = 'BytesTiffImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}CCITT_1.tif")
    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_ImageInputUsingCloudRoot_TiffImageAddedToInput_Pdfoutput
    @name = 'CloudRootTiffImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = ImageInput.new('Small.jpg')
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathTiffImageWithProperties_Pdfoutput
    @name = 'FilePathTiffImageWithProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}CCITT_1.tif")
    input = ImageInput.new(resource)
    pdf.inputs << input
    input.right_margin = 50
    input.bottom_margin = 50
    input.top_margin = 50
    input.left_margin = 50

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMulitiTiffImage_Pdfoutput
    @name = 'FilePathMulitiTiffImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}PalaisDuLouvre.tif")
    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples6.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamMulitiTiffImage_Pdfoutput
    @name = 'StreamMulitiTiffImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}PalaisDuLouvre.tif", 'rb')
    resource = ImageResource.new(file)
    file.close
    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples7.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesMulitiTiffImage_Pdfoutput
    @name = 'BytesMulitiTiffImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}PalaisDuLouvre.tif")

    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples8.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples8.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMulitiTiffImageWithProperties_Pdfoutput
    @name = 'FilePathMulitiTiffImageWithProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}PalaisDuLouvre.tif")
    input = ImageInput.new(resource)
    input.right_margin = 50
    input.bottom_margin = 50
    input.top_margin = 50
    input.left_margin = 50
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples9.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples9.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPngImage_Pdfoutput
    @name = 'FilePathPngImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}170x220_T.png")
    input = ImageInput.new(resource)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples10.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples10.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamPngImage_Pdfoutput
    @name = 'StreamPngImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}170x220_T.png", 'rb')
    resource = ImageResource.new(file)
    file.close

    input = ImageInput.new(resource)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples11.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples11.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesPngImage_Pdfoutput
    @name = 'BytesPngImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}170x220_T.png")
    input = ImageInput.new(resource)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples12.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples12.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootPngImage_Pdfoutput
    @name = 'CloudRootPngImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = ImageInput.new('170x220_T.png')

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples13.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples13.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderPngImage_Pdfoutput
    @name = 'CloudSubFolderPngImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = ImageInput.new('Resources/170x220_T.png')

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples14.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples14.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPngImageWithProperties_Pdfoutput
    @name = 'FilePathPngImageWithProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}170x220_T.png")
    input = ImageInput.new(resource)
    input.scale_x = 4
    input.scale_y = 4
    input.page_width = 400
    input.page_height = 400
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples15.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples15.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathGifImage_Pdfouput
    @name = 'FilePathGifImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")

    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples16.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples16.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamGifImage_Pdfouput
    @name = 'StreamGifImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}Northwind Logo.gif", 'rb')
    resource = ImageResource.new(file)
    file.close

    input = ImageInput.new(resource)
    pdf.inputs << input
    input.align = Align::LEFT
    input.v_align = VAlign::CENTER
    input.page_width = 400
    input.page_height = 400

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples17.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples17.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesGifImage_Pdfouput
    @name = 'BytesGifImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples18.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples18.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootGifImage_Pdfouput
    @name = 'CloudRootGifImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = ImageInput.new('Northwind Logo.gif')

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples19.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples19.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderGifImage_Pdfouput
    @name = 'CloudSubFolderGifImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = ImageInput.new('Resources/Northwind Logo.gif')

    pdf.inputs << input
    input.align = Align::LEFT
    input.v_align = VAlign::CENTER
    input.page_width = 400
    input.page_height = 400

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples20.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples20.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathGifImageWithProperties_Pdfouput
    @name = 'FilePathGifImageWithProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    input = ImageInput.new(resource)
    pdf.inputs << input
    input.align = Align::LEFT
    input.v_align = VAlign::CENTER
    input.page_width = 400
    input.page_height = 400

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples21.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples21.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathJpegImage_Pdfoutput
    @name = 'FilePathJpegImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}Small.jpg")
    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples22.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples22.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamJpegImage_Pdfoutput
    @name = 'StreamJpegImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}Small.jpg", 'rb')
    resource = ImageResource.new(file)
    file.close

    input = ImageInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples23.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples23.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesJpegImage_Pdfoutput
    @name = 'BytesJpegImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}Small.jpg")
    input = ImageInput.new(resource)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples24.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples24.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootJpegImage_Pdfoutput
    @name = 'CloudRootJpegImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = ImageInput.new('Small.jpg')

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples25.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples25.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderJpegImage_Pdfoutput
    @name = 'CloudSubFolderJpegImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = ImageInput.new('Resources/Small.jpg')

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples26.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples26.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathJpegImageWithProperties_Pdfoutput
    @name = 'FilePathJpegImageWithProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}Small.jpg")
    input = ImageInput.new(resource)
    pdf.inputs << input
    input.shrink_to_fit = true
    input.page_width = 500
    input.page_height = 500

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples27.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples27.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathImageWithPropertiesAddedToTemplate_Pdfoutput
    @name = 'ImageWithPropertiesAddedToTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}Northwind Logo.gif")
    imageInput = ImageInput.new(resource)
    pdf.inputs << imageInput
    imageInput.align = Align::LEFT
    imageInput.v_align = VAlign::CENTER
    imageInput.page_width = 400
    imageInput.page_height = 400

    # create EvenAddTemplate with pagenumbering label
    templateC = Template.new('TemplateB')
    pageNumberingElement2 = PageNumberingElement.new('%%CP%% of %%TP%%', ElementPlacement::BOTTOM_LEFT)
    templateC.elements << pageNumberingElement2

    imageInput.set_template(templateC)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples28.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples28.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathTiffImage_AddImage_Pdfoutput
    @name = 'FilePathTiffImage_AddImage'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = ImageResource.new("#{INPUT_PATH}CCITT_1.tif")
    pdf.add_image(resource)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}ImageInputSamples29.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}ImageInputSamples29.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
