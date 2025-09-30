require "minitest/autorun"
require "ruby_client"
require_relative "./../../TestParameters"

include DynamicPDFApi

class WordInputSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_WordFile_pdfoutput
    @name = "WordToPdf"
    pdf = Pdf.new()
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    wordResource = WordResource.new("#{INPUT_PATH}Doc1.docx")
    word = WordInput.new(wordResource)

    word.page_width = 300
    word.page_height = 200

    word.top_margin = 10
    word.bottom_margin = 10
    word.right_margin = 40
    word.left_margin = 40

    pdf.inputs.push(word)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}WordToPdf_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}WordToPdf_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_WordFileTextReplace_pdfoutput()
    @name = "WordToPdfTextReplace"
    pdf = Pdf.new()
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    wordResource = WordResource.new("#{INPUT_PATH}Doc1.docx")
    word = WordInput.new(wordResource)

    word.page_width = 300
    word.page_height = 200

    word.top_margin = 10
    word.bottom_margin = 10
    word.right_margin = 40
    word.left_margin = 40
    word.text_replace << TextReplace.new("ve", "Data", true)
    pdf.inputs << word

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}WordToPdfTextReplace_PdfOutput.pdf", "wb") { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}WordToPdfTextReplace_JsonOutput.json", "w") { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
