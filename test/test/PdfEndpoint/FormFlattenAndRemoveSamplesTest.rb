require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

class FormflattenAndremoveSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PdfInputFilePath_Field_Pdfoutput
    @name = 'FilePathField'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    field.flatten = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    field1.flatten = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    field2.flatten = true
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field3.flatten = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field4.flatten = false
    pdf.form_fields << field4

    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    field5.flatten = true
    pdf.form_fields << field5

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputStream_FormflattenField_Pdfoutput
    @name = 'StreamField'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}fw9AcroForm_14.pdf", 'rb')
    resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    field.flatten = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    field1.flatten = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    field2.flatten = true
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field3.flatten = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field4.flatten = false
    pdf.form_fields << field4

    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    field5.flatten = true
    pdf.form_fields << field5

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputBytes_FormflattenField_Pdfoutput
    @name = 'BytesField'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    field.flatten = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    field1.flatten = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    field2.flatten = true
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field3.flatten = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field4.flatten = false
    pdf.form_fields << field4

    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    field5.flatten = true
    pdf.form_fields << field5

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputCloudRoot_FormflattenField_Pdfoutput
    @name = 'CloudRootField'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('fw9AcroForm_14.pdf')
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    field.flatten = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    field1.flatten = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    field2.flatten = true
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field3.flatten = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field4.flatten = false
    pdf.form_fields << field4

    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    field5.flatten = true
    pdf.form_fields << field5

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputCloudSubFolder_FormflattenField_Pdfoutput
    @name = 'CloudSubFolderField'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('Resources/fw9AcroForm_14.pdf')
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    field.flatten = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    field1.flatten = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    field2.flatten = true
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field3.flatten = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field4.flatten = false
    pdf.form_fields << field4

    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    field5.flatten = true
    pdf.form_fields << field5

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputFilePath_FormflattenFieldremove_Pdfoutput
    @name = 'FilePathFieldremove'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]')
    field.remove = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]')
    field1.remove = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field2.remove = false
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field3.remove = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]')
    field4.remove = true
    pdf.form_fields << field4

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples6.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputStream_FormflattenFieldremove_Pdfoutput
    @name = 'StreamFieldremove'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}fw9AcroForm_14.pdf", 'rb')
    resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]')
    field.remove = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]')
    field1.remove = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field2.remove = false
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field3.remove = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]')
    field4.remove = true
    pdf.form_fields << field4

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples7.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputBytes_FormflattenFieldremove_Pdfoutput
    @name = 'BytesFieldremove'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]')
    field.remove = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]')
    field1.remove = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field2.remove = false
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field3.remove = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]')
    field4.remove = true
    pdf.form_fields << field4

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples8.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples8.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudRoot_FormflattenFieldremove_Pdfoutput
    @name = 'CloudRootFieldremove'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('fw9AcroForm_14.pdf')
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]')
    field.remove = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]')
    field1.remove = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field2.remove = false
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field3.remove = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]')
    field4.remove = true
    pdf.form_fields << field4

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples9.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples9.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudSubFolder_FormflattenFieldremove_Pdfoutput
    @name = 'CloudSubFolderFieldremove'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('Resources/fw9AcroForm_14.pdf')
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]')
    field.remove = true
    pdf.form_fields << field

    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]')
    field1.remove = true
    pdf.form_fields << field1

    field2 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    field2.remove = false
    pdf.form_fields << field2

    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    field3.remove = false
    pdf.form_fields << field3

    field4 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]')
    field4.remove = true
    pdf.form_fields << field4

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples10.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples10.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_FormflattenAllFields_Pdfoutput
    @name = 'FilePathAllFields'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    pdf.form_fields << field
    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    pdf.form_fields << field1
    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    pdf.form_fields << field2
    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    pdf.form_fields << field3
    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    pdf.form_fields << field4
    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    pdf.form_fields << field5
    field6 = FormField.new('topmostSubform[0].Page1[0].f1_10[0]', '17288825617')
    pdf.form_fields << field6
    field7 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]', '52')
    pdf.form_fields << field7
    field8 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]', '1234567')
    pdf.form_fields << field8

    pdf.flatten_all_form_fields = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples11.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples11.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingStream_FormflattenAllFields_Pdfoutput
    @name = 'StreamAllFields'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}fw9AcroForm_14.pdf", 'rb')
    resource = PdfResource.new(file)
    file.close
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    pdf.form_fields << field
    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    pdf.form_fields << field1
    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    pdf.form_fields << field2
    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    pdf.form_fields << field3
    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    pdf.form_fields << field4
    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    pdf.form_fields << field5
    field6 = FormField.new('topmostSubform[0].Page1[0].f1_10[0]', '17288825617')
    pdf.form_fields << field6
    field7 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]', '52')
    pdf.form_fields << field7
    field8 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]', '1234567')
    pdf.form_fields << field8

    pdf.flatten_all_form_fields = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples12.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples12.json", 'w') do |file|
      file.write(pdf.get_instructions_json)
    end

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingBytes_FormflattenAllFields_Pdfoutput
    @name = 'BytesAllFields'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}fw9AcroForm_14.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    pdf.form_fields << field
    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    pdf.form_fields << field1
    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    pdf.form_fields << field2
    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    pdf.form_fields << field3
    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    pdf.form_fields << field4
    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    pdf.form_fields << field5
    field6 = FormField.new('topmostSubform[0].Page1[0].f1_10[0]', '17288825617')
    pdf.form_fields << field6
    field7 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]', '52')
    pdf.form_fields << field7
    field8 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]', '1234567')
    pdf.form_fields << field8

    pdf.flatten_all_form_fields = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples13.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples13.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudRoot_AllFields_Pdfoutput
    @name = 'CloudRootAllFields'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('fw9AcroForm_14.pdf')
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    pdf.form_fields << field
    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    pdf.form_fields << field1
    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    pdf.form_fields << field2
    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    pdf.form_fields << field3
    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    pdf.form_fields << field4
    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    pdf.form_fields << field5
    field6 = FormField.new('topmostSubform[0].Page1[0].f1_10[0]', '17288825617')
    pdf.form_fields << field6
    field7 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]', '52')
    pdf.form_fields << field7
    field8 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]', '1234567')
    pdf.form_fields << field8

    pdf.flatten_all_form_fields = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples14.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples14.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudSubFolder_AllFields_Pdfoutput
    @name = 'CloudSubFolderAllFields'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('Resources/fw9AcroForm_14.pdf')
    pdf.inputs << input

    field = FormField.new('topmostSubform[0].Page1[0].f1_1[0]', 'Any Company, Inc.')
    pdf.form_fields << field
    field1 = FormField.new('topmostSubform[0].Page1[0].f1_2[0]', 'Any Company')
    pdf.form_fields << field1
    field2 = FormField.new('topmostSubform[0].Page1[0].FederalClassification[0].c1_1[0]', '1')
    pdf.form_fields << field2
    field3 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_7[0]', '123 Main Street')
    pdf.form_fields << field3
    field4 = FormField.new('topmostSubform[0].Page1[0].Address[0].f1_8[0]', 'Washington, DC  22222')
    pdf.form_fields << field4
    field5 = FormField.new('topmostSubform[0].Page1[0].f1_9[0]', 'Any Requester')
    pdf.form_fields << field5
    field6 = FormField.new('topmostSubform[0].Page1[0].f1_10[0]', '17288825617')
    pdf.form_fields << field6
    field7 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_14[0]', '52')
    pdf.form_fields << field7
    field8 = FormField.new('topmostSubform[0].Page1[0].EmployerID[0].f1_15[0]', '1234567')
    pdf.form_fields << field8

    pdf.flatten_all_form_fields = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples15.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples15.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_RetainSignature_Pdfoutput
    @name = 'FilePathRetainSignature'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}Org.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input
    pdf.flatten_all_form_fields = true
    pdf.retain_signature_form_fields = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples16.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples16.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingStream_RetainSignature_Pdfoutput
    @name = 'StreamRetainSignature'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}Org.pdf", 'rb')
    resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(resource)
    pdf.inputs << input

    pdf.flatten_all_form_fields = true
    pdf.retain_signature_form_fields = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples17.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples17.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingBytes_RetainSignature_Pdfoutput
    @name = 'BytesRetainSignature'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}Org.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    pdf.flatten_all_form_fields = true
    pdf.retain_signature_form_fields = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples18.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples18.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudRoot_RetainSignature_Pdfoutput
    @name = 'CloudRootRetainSignature'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('Org.pdf')
    pdf.inputs << input

    pdf.flatten_all_form_fields = true
    pdf.retain_signature_form_fields = true

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples19.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormflattenAndremoveSamples19.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
