require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

include DynamicPDFApi

class PdfInputSamplesTest < Minitest::Test
  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_FilePath_PdfOutput
    @name = 'FilePath'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}Emptypages.pdf")
    pdf_input = PdfInput.new(pdf_resource)
    pdf.inputs << pdf_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_Bytes_PdfOutput
    @name = 'Bytes'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}Emptypages.pdf")
    pdf_input = PdfInput.new(pdf_resource)
    pdf.inputs << pdf_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_Stream_PdfOutput
    @name = 'Stream'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}Emptypages.pdf", 'rb')
    pdf_resource = PdfResource.new(file)
    file.close

    pdf_input = PdfInput.new(pdf_resource)
    pdf.inputs << pdf_input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRoot_PdfOutput
    @name = 'CloudRoot'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_input = PdfInput.new('Emptypages.pdf')

    pdf.inputs << pdf_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolder_PdfOutput
    @name = 'CloudSubFolder'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_input = PdfInput.new('Resources/Emptypages.pdf')

    pdf.inputs << pdf_input
    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathPdfInputs_PdfOutput
    @name = 'FilePathInputs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    fw9_acro_form_18_resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_18.pdf")
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples6.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesPdfInputs_PdfOutput
    @name = 'BytesInputs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice_resource = PdfResource.new("#{INPUT_PATH}Invoice.pdf")
    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    fw9_acro_form_18_resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_18.pdf")
    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    document_a100_resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples7.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamPdfInputs_PdfOutput
    @name = 'StreamInputs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}Invoice.pdf", 'rb')
    invoice_resource = PdfResource.new(file)
    file.close

    invoice = PdfInput.new(invoice_resource)
    pdf.inputs << invoice

    file2 = File.open("#{INPUT_PATH}fw9AcroForm_18.pdf", 'rb')
    fw9_acro_form_18_resource = PdfResource.new(file2)
    file2.close

    fw9_acro_form_18 = PdfInput.new(fw9_acro_form_18_resource)
    pdf.inputs << fw9_acro_form_18

    file3 = File.open("#{INPUT_PATH}DocumentA100.pdf", 'rb')
    document_a100_resource = PdfResource.new(file3)
    file3.close

    document_a100 = PdfInput.new(document_a100_resource)
    pdf.inputs << document_a100

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples8.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples8.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootPdfInputs_PdfOutput
    @name = 'CloudRootPdfInputs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice = PdfInput.new('Invoice.pdf')
    pdf.inputs << invoice

    fw9_acro_form_18 = PdfInput.new('fw9AcroForm_18.pdf')
    pdf.inputs << fw9_acro_form_18

    document_a100 = PdfInput.new('DocumentA100.pdf')
    pdf.inputs << document_a100

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples9.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples9.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderPdfInputs_PdfOutput
    @name = 'CloudSubFolderPdfInputs'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    invoice = PdfInput.new('Resources/Invoice.pdf')
    pdf.inputs << invoice

    fw9_acro_form_18 = PdfInput.new('Resources/fw9AcroForm_18.pdf')
    pdf.inputs << fw9_acro_form_18

    document_a100 = PdfInput.new('Resources/DocumentA100.pdf')
    pdf.inputs << document_a100

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples10.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples10.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeMultipleDocuments_PdfOutput
    @name = 'FilePathMergeMultipleDocuments'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    input.start_page = 1
    input.page_count = 6
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}All Fields Sample.pdf")
    input1 = PdfInput.new(resource1)
    pdf.inputs << input1

    resource2 = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input2 = PdfInput.new(resource2)
    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples11.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples11.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_BytesMergeMultipleDocuments_PdfOutput
    @name = 'BytesPathMergeMultipleDocuments'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    input.start_page = 1
    input.page_count = 6
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}All Fields Sample.pdf")
    input1 = PdfInput.new(resource1)
    pdf.inputs << input1

    resource2 = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input2 = PdfInput.new(resource2)
    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples12.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples12.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_StreamMergeMultipleDocuments_PdfOutput
    @name = 'StreamPathMergeMultipleDocuments'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}AllPageElements.pdf", 'rb')
    resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(resource)
    input.start_page = 1
    input.page_count = 6
    pdf.inputs << input

    file1 = File.open("#{INPUT_PATH}All Fields Sample.pdf", 'rb')
    resource1 = PdfResource.new(file1)
    file1.close
    input1 = PdfInput.new(resource1)
    pdf.inputs << input1

    file2 = File.open("#{INPUT_PATH}fw9AcroForm_14.pdf", 'rb')
    resource2 = PdfResource.new(file2)
    file2.close

    input2 = PdfInput.new(resource2)
    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples13.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples13.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudRootMergeMultipleDocuments_PdfOutput
    @name = 'CloudRootMergeMultipleDocuments'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('AllPageElements.pdf')
    input.start_page = 1
    input.page_count = 6
    pdf.inputs << input

    input1 = PdfInput.new('All Fields Sample.pdf')
    pdf.inputs << input1

    input2 = PdfInput.new('fw9AcroForm_14.pdf')
    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples14.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples14.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_CloudSubFolderMergeMultipleDocuments_PdfOutput
    @name = 'CloudSubFolderMergeMultipleDocuments'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('Resources/AllPageElements.pdf')
    input.start_page = 1
    input.page_count = 6
    pdf.inputs << input

    input1 = PdfInput.new('Resources/All Fields Sample.pdf')
    pdf.inputs << input1

    input2 = PdfInput.new('Resources/fw9AcroForm_14.pdf')
    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples15.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples15.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathSimpleMerge_PdfOutput
    @name = 'FilePathSimpleMerge'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples16.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples16.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeStartPageAndPageCount_PdfOutput
    @name = 'FilePathSimpleMergePpty'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentA100.pdf")
    input = PdfInput.new(resource)
    input.start_page = 2
    input.page_count = 10
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples17.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples17.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeWithSameInput_PdfOutput
    @name = 'FilePathMergeWithSameInput'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input1 = PdfInput.new(resource1)
    pdf.inputs << input1

    resource2 = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input2 = PdfInput.new(resource2)
    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples18.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples18.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptions_PdfOutput
    @name = 'FilePathMergeOptions'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples19.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples19.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsWithMultipleDocuments_PdfOutput
    @name = 'FilePathMergeOptionsWithMultipleDocuments'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    input.merge_options = merge_options
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}All Fields Sample.pdf")
    input1 = PdfInput.new(resource1)
    input1.start_page = 1
    input1.page_count = 1

    merge_options1 = MergeOptions.new
    merge_options1.forms_xfa_data = true
    input1.merge_options = merge_options1
    pdf.inputs << input1

    resource2 = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input2 = PdfInput.new(resource2)

    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples20.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples20.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsDocumentInfo_PdfOutput
    @name = 'FilePathMergeOptionsDocumentInfo'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.document_info = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples21.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples21.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsDocumentJavaScript_PdfOutput
    @name = 'FilePathMergeOptionsDocumentJavaScript'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}JavaScriptSample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.document_java_script = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples22.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples22.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsDocumentProperties_PdfOutput
    @name = 'FilePathMergeOptionsDocumentProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}DocumentPropertiesSample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.document_properties = true
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples23.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples23.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsEmbeddedFiles_PdfOutput
    @name = 'FilePathMergeOptionsEmbeddedFiles'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}EmbedFilesSample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.embedded_files = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples24.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples24.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsFormFields_PdfOutput
    @name = 'FilePathMergeOptionsFormFields'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.form_fields = true
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples25.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples25.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsFormsXfaData_PdfOutput
    @name = 'FilePathMergeOptionsFormsXfaData'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}All Fields Sample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.forms_xfa_data = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples26.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples26.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsLogicalStructure_PdfOutput
    @name = 'FilePathMergeOptionsLogicalStructure'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.logical_structure = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples27.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples27.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsOpenAction_PdfOutput
    @name = 'FilePathMergeOptionsOpenAction'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}OpenActionSample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.open_action = true
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples28.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples28.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsOptionalContentInfo_PdfOutput
    @name = 'FilePathMergeOptionsOptionalContentInfo'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}OptionalContentInfoSample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.optional_content_info = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples29.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples29.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsOutlines_PdfOutput
    @name = 'FilePathMergeOptionsOutlines'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.out_lines = true
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples30.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples30.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsOutputIntent_PdfOutput
    @name = 'FilePathMergeOptionsOutputIntent'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}OutputIntentSample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.output_intent = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples31.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples31.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsPageAnnotations_PdfOutput
    @name = 'FilePathMergeOptionsPageAnnotations'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}NoteAnnotSample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.page_annotations = true
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples32.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples32.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsPageLabelsAndSections_PdfOutput
    @name = 'FilePathMergeOptionsPageLabelsAndSections'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}PageSectionSample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.page_labels_and_sections = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples33.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples33.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsRootFormField_PdfOutput
    @name = 'FilePathMergeOptionsRootFormField'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.root_form_field = 'RootName'
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples34.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples34.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsXmpMetadata_PdfOutput
    @name = 'FilePathMergeOptionsXmpMetadata'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.xmp_metadata = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples35.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples35.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsAllTrue_PdfOutput
    @name = 'FilePathMergeOptionsAllTrue'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.document_info = true
    merge_options.document_java_script = true
    merge_options.document_properties = true
    merge_options.embedded_files = true
    merge_options.form_fields = true
    merge_options.forms_xfa_data = true
    merge_options.logical_structure = true
    merge_options.open_action = true
    merge_options.optional_content_info = true
    merge_options.out_lines = true
    merge_options.output_intent = true
    merge_options.page_annotations = true
    merge_options.page_labels_and_sections = true
    merge_options.xmp_metadata = true
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples36.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples36.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsAllFalse_PdfOutput
    @name = 'FilePathMergeOptionsAllFalse'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)

    merge_options = MergeOptions.new
    merge_options.document_info = false
    merge_options.document_java_script = false
    merge_options.document_properties = false
    merge_options.embedded_files = false
    merge_options.form_fields = false
    merge_options.forms_xfa_data = false
    merge_options.logical_structure = false
    merge_options.open_action = false
    merge_options.optional_content_info = false
    merge_options.out_lines = false
    merge_options.output_intent = false
    merge_options.page_annotations = false
    merge_options.page_labels_and_sections = false
    merge_options.xmp_metadata = false
    input.merge_options = merge_options
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples37.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples37.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsWithTemplateAllPages_PdfOutput
    @name = 'FilePathMergeOptionsWithTemplateAllPages'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    template = Template.new('Temp1')
    element = TextElement.new('Merger with Template(All Pages)', ElementPlacement::TOP_CENTER)
    template.elements << element

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    input.set_template(template)

    merge_options = MergeOptions.new
    input.merge_options = merge_options
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}All Fields Sample.pdf")
    input1 = PdfInput.new(resource1)
    input1.set_template(template)
    input1.start_page = 1
    input1.page_count = 1
    merge_options1 = MergeOptions.new
    merge_options1.forms_xfa_data = true
    input1.merge_options = merge_options1
    pdf.inputs << input1

    resource2 = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input2 = PdfInput.new(resource2)
    input2.set_template(template)
    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples38.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples38.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsWithTemplateEvenPages_PdfOutput
    @name = 'FilePathMergeOptionsWithTemplateEvenPages'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    template = Template.new('Temp1')
    element = TextElement.new('Merger with Template(Even Pages)', ElementPlacement::TOP_CENTER)
    element.even_pages = true
    template.elements << element

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    input.set_template(template)

    merge_options = MergeOptions.new
    input.merge_options = merge_options
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}All Fields Sample.pdf")
    input1 = PdfInput.new(resource1)
    input1.set_template(template)

    input1.start_page = 1
    input1.page_count = 1
    merge_options1 = MergeOptions.new
    merge_options1.forms_xfa_data = true
    input1.merge_options = merge_options1
    pdf.inputs << input1

    resource2 = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input2 = PdfInput.new(resource2)
    input2.set_template(template)

    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples39.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples39.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsWithTemplateOddPages_PdfOutput
    @name = 'FilePathMergeOptionsWithTemplateOddPages'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    template = Template.new('Temp1')
    element = TextElement.new('Merger with Template(Odd Pages)', ElementPlacement::TOP_CENTER)
    element.odd_pages = true
    template.elements << element

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    input.set_template(template)

    merge_options = MergeOptions.new
    input.merge_options = merge_options
    pdf.inputs << input

    resource1 = PdfResource.new("#{INPUT_PATH}All Fields Sample.pdf")
    input1 = PdfInput.new(resource1)
    input1.set_template(template)

    input1.start_page = 1
    input1.page_count = 1
    merge_options1 = MergeOptions.new
    merge_options1.forms_xfa_data = true
    input1.merge_options = merge_options1
    pdf.inputs << input1

    resource2 = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input2 = PdfInput.new(resource2)
    input2.set_template(template)

    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples40.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples40.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePathMergeOptionsWithTemplates_PdfOutput
    @name = 'FilePathMergeOptionsWithTemplates'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    template1 = Template.new('Temp1')
    element1 = TextElement.new('Merger with Template(First Dcoument)', ElementPlacement::TOP_CENTER)
    template1.elements << element1

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    input.set_template(template1)

    merge_options = MergeOptions.new
    input.merge_options = merge_options
    pdf.inputs << input

    template2 = Template.new('Temp2')
    element2 = TextElement.new('Merger with Template(Second Dcoument)', ElementPlacement::TOP_CENTER)
    template2.elements << element2

    resource1 = PdfResource.new("#{INPUT_PATH}All Fields Sample.pdf")
    input1 = PdfInput.new(resource1)
    input1.set_template(template2)

    input1.start_page = 1
    input1.page_count = 1
    merge_options1 = MergeOptions.new
    merge_options1.forms_xfa_data = true
    input1.merge_options = merge_options1
    pdf.inputs << input1

    template3 = Template.new('Temp3')
    element3 = TextElement.new('Merger with Template(Third Dcoument)', ElementPlacement::TOP_CENTER)
    template3.elements << element3

    resource2 = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input2 = PdfInput.new(resource2)
    input2.set_template(template3)

    pdf.inputs << input2

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples41.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples41.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePath_AddPdf_PdfOutput
    @name = 'FilePath_AddPdf'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf_resource = PdfResource.new("#{INPUT_PATH}Emptypages.pdf")
    pdf.add_pdf(pdf_resource)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples42.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples42.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_FilePath_AddPdfParameters_PdfOutput
    @name = 'FilePath_AddPdfParameters'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    merge_options = MergeOptions.new

    pdf_resource = PdfResource.new("#{INPUT_PATH}Emptypages.pdf")
    pdf.add_pdf(pdf_resource, merge_options)

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples43.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples43.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_Cloud_AddPdf_PdfOutput
    @name = 'Cloud_AddPdf'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    pdf.add_pdf('DocumentA100.pdf')

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}PdfInputSamples44.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}PdfInputSamples44.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
