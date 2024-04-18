require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

include DynamicPDFApi

class FontSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PageInput_CoreFont_Pdfoutput
    @name = 'CoreFont'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(Font.times_bold_italic)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples1.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_CoreFonts_Pdfoutput
    @name = 'CoreFonts'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    element = TextElement.new('Hello World (HelveticaBold)', ElementPlacement::TOP_CENTER)
    element.font(Font.helvetica_bold)
    page_input.elements << element

    element1 = TextElement.new('Hello World (CourierBoldOblique)', ElementPlacement::TOP_CENTER, 0, 100)
    element1.font(Font.courier_bold_oblique)
    page_input.elements << element1

    element2 = TextElement.new('#&%() +0123', ElementPlacement::TOP_CENTER, 0, 200)
    element2.font(Font.symbol)
    page_input.elements << element2

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples2.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_TtfFont_Pdfoutput
    @name = 'TtfFont'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.from_file("#{INPUT_PATH}arialbi.ttf")

    page_input = PageInput.new

    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples3.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_OtfFont_Pdfoutput
    @name = 'OtfFont'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.from_file("#{INPUT_PATH}Calibri.otf")

    page_input = PageInput.new

    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples4.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_MultipleFonts_Pdfoutput
    @name = 'MultipleFonts'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new

    font = Font.from_file("#{INPUT_PATH}arialbi.ttf")
    element = TextElement.new('Hello World (arialbi)', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    font1 = Font.from_file("#{INPUT_PATH}Calibri.otf")
    element1 = TextElement.new('Hello World (Calibri)', ElementPlacement::TOP_CENTER, 0, 100)
    element1.font(font1)
    page_input.elements << element1

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples5.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_Embed_Pdfoutput
    @name = 'Embed'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.from_file("#{INPUT_PATH}verdanab.ttf")
    font.embed = false

    page_input = PageInput.new
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples6.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_Subset_Pdfoutput
    @name = 'Subset'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.from_file("#{INPUT_PATH}verdanab.ttf")
    font.subset = false

    page_input = PageInput.new

    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples7.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInput_WithTemplate_Pdfoutput
    @name = 'WithTemplate'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}SinglePage.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    font = Font.from_file("#{INPUT_PATH}arialbi.ttf")

    template = Template.new('Temp1')
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    template.elements << element
    input.set_template(template)

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples8.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples8.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_CloudRoot_Pdfoutput
    @name = 'CloudRoot'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.new('Calibri.otf')

    page_input = PageInput.new

    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples9.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples9.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_CloudSubFolder_Pdfoutput
    @name = 'CloudSubFolder'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.new('Resources/Calibri.otf')

    page_input = PageInput.new
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples10.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples10.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInput_CloudRootWithTemplate_Pdfoutput
    @name = 'CloudRootWithTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.new('Calibri.otf')

    resource = PdfResource.new("#{INPUT_PATH}SinglePage.pdf")
    input = PdfInput.new(resource)

    template = Template.new('Temp1')
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    template.elements << element
    input.set_template(template)

    pdf.inputs << input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples11.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples11.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInput_CloudSubFolderWithTemplate_Pdfoutput
    @name = 'CloudSubFolderWithTemplate'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.new('Resources/Calibri.otf')

    resource = PdfResource.new("#{INPUT_PATH}SinglePage.pdf")
    input = PdfInput.new(resource)

    template = Template.new('Temp1')
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    template.elements << element
    input.set_template(template)

    pdf.inputs << input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples12.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples12.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_EmbedSubset_Pdfoutput
    @name = 'EmbedSubset'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.from_file("#{INPUT_PATH}verdanab.ttf")
    font.embed = true
    font.subset = false

    page_input = PageInput.new

    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples13.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples13.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_SubsetEmbed_Pdfoutput
    @name = 'SubsetEmbed'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.from_file("#{INPUT_PATH}verdanab.ttf")
    font.subset = true
    font.embed = false

    page_input = PageInput.new

    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples14.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples14.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_CoreFontsHelvetica_Pdfoutput
    @name = 'CoreFontsHelvetica'
    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new('Hello World (Helvetica)', ElementPlacement::TOP_CENTER)
    element.font(Font.helvetica)
    page_input.elements << element

    element1 = TextElement.new('Hello World (HelveticaBold)', ElementPlacement::TOP_CENTER, 0, 100)
    element1.font(Font.helvetica_bold)
    page_input.elements << element1

    element2 = TextElement.new('Hello World (HelveticaBoldOblique)', ElementPlacement::TOP_CENTER, 0, 200)
    element2.font(Font.helvetica_bold_oblique)
    page_input.elements << element2

    element3 = TextElement.new('Hello World (HelveticaOblique)', ElementPlacement::TOP_CENTER, 0, 300)
    element3.font(Font.helvetica_oblique)
    page_input.elements << element3

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples15.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples15.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_CoreFontsCourier_Pdfoutput
    @name = 'CoreFontsCourier'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new('Hello World (Courier)', ElementPlacement::TOP_CENTER)
    element.font(Font.courier)
    page_input.elements << element

    element1 = TextElement.new('Hello World (CourierBold)', ElementPlacement::TOP_CENTER, 0, 100)
    element1.font(Font.courier_bold)
    page_input.elements << element1

    element2 = TextElement.new('Hello World (CourierBoldOblique)', ElementPlacement::TOP_CENTER, 0, 200)
    element2.font(Font.courier_bold_oblique)
    page_input.elements << element2

    element3 = TextElement.new('Hello World (CourierOblique)', ElementPlacement::TOP_CENTER, 0, 300)
    element3.font(Font.courier_oblique)
    page_input.elements << element3

    pdf.inputs << page_input

    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples16.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples16.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_CoreFontsTimesRoman_Pdfoutput
    @name = 'CoreFontsTimesRoman'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    page_input = PageInput.new
    element = TextElement.new('Hello World (TimesBold)', ElementPlacement::TOP_CENTER)
    element.font(Font.times_bold)
    page_input.elements << element

    element1 = TextElement.new('Hello World (TimesBoldItalic)', ElementPlacement::TOP_CENTER, 0, 100)
    element1.font(Font.times_bold_italic)
    page_input.elements << element1

    element2 = TextElement.new('Hello World (TimesItalic)', ElementPlacement::TOP_CENTER, 0, 200)
    element2.font(Font.times_italic)
    page_input.elements << element2

    element3 = TextElement.new('Hello World (TimesRoman)', ElementPlacement::TOP_CENTER, 0, 300)
    element3.font(Font.times_roman)
    page_input.elements << element3

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}FontSamples17.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}FontSamples17.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_GoogleFont_Pdfoutput
    @name = 'GoogleFont'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.google("Roboto", 300, false)
    font.embed = true
    font.subset = true

    page_input = PageInput.new
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}GoogleFont.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}GoogleFont.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_GlobalFont_Pdfoutput
    @name = 'GlobalFont'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    font = Font.global("Paris Normal")
    font.embed = true
    font.subset = true

    page_input = PageInput.new
    element = TextElement.new('Hello World', ElementPlacement::TOP_CENTER)
    element.font(font)
    page_input.elements << element

    pdf.inputs << page_input
    response = pdf.process

    File.open("#{OUTPUT_PATH}GlobalFont.pdf", 'wb') { |file| file.write(response.content) } if response.is_successful

    File.open("#{OUTPUT_PATH}GlobalFont.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
