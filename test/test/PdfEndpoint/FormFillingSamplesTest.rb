require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

class FormFillingSamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PdfInputFilePath_PdfOutput
    @name = 'PdfInputFilePath'

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

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormFillingSamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputStream_PdfOutput
    @name = 'PdfInputStream'

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

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormFillingSamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputBytes_PdfOutput
    @name = 'PdfInputBytes'

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

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormFillingSamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputCloudRoot_FormFill_PdfOutput
    @name = 'PdfInputCloudRoot'

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

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormFillingSamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputCloudSubFolder_PdfOutput
    @name = 'PdfInputCloudSubFolder'

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

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormFillingSamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputFilePath_TextBox_PdfOutput
    @name = 'TextBox'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('txtfname', 'My Text')
    pdf.form_fields << field

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples6.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormFillingSamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputFilePath_ComboBox_PdfOutput
    @name = 'ComboBox'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('cmbname', 'Item3')
    pdf.form_fields << field

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples7.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormFillingSamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputFilePath_ListBox_PdfOutput
    @name = 'ListBox'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('lbname', 'Item 4')
    pdf.form_fields << field

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples8.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormFillingSamples8.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputFilePath_RadioButton_PdfOutput
    @name = 'RadioButton'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('rbname', 'Radio2')
    pdf.form_fields << field

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples9.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}FormFillingSamples9.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputFilePath_CheckBox_PdfOutput
    @name = 'CheckBox'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}AllPageElements.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('cbxname', 'Yes')
    pdf.form_fields << field

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples10.pdf", 'wb') { |file| file.write(response.content) }
    end
    File.open("#{OUTPUT_PATH}FormFillingSamples10.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputFilePath_XfaFormFill_Pdfoutput
    @name = 'Xfa'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}All Fields Sample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('form1[0].#subform[0].TextField1[0]', 'text')
    pdf.form_fields << field
    field1 = FormField.new('form1[0].#subform[0].DateField1[0]', '07/03/0217')
    pdf.form_fields << field1
    field2 = FormField.new('form1[0].#subform[0].NumericField1[0]', '2594')
    pdf.form_fields << field2
    field3 = FormField.new('form1[0].#subform[0].DecimalField1[0]', '25.94')
    pdf.form_fields << field3
    field4 = FormField.new('form1[0].#subform[0].Subform1[0].CheckBox1[0]', '1')
    pdf.form_fields << field4
    field5 = FormField.new('form1[0].#subform[0].Subform1[0].CheckBox1[2]', '1')
    pdf.form_fields << field5
    field6 = FormField.new('form1[0].#subform[0].Subform1[1].RadioButtonList[1]', '1')
    pdf.form_fields << field6
    field7 = FormField.new('form1[0].#subform[0].ListBox1[0]', 'Full Time')
    pdf.form_fields << field7
    field8 = FormField.new('form1[0].#subform[0].DropDownList1[0]', 'Third')
    pdf.form_fields << field8

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples11.pdf", 'wb') { |file| file.write(response.content) }
    end
    File.open("#{OUTPUT_PATH}FormFillingSamples11.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputStream_Xfa_Pdfoutput
    @name = 'XfaStream'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = open("#{INPUT_PATH}All Fields Sample.pdf", 'rb')
    resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(resource)
    pdf.inputs << input

    field = FormField.new('form1[0].#subform[0].TextField1[0]', 'text')
    pdf.form_fields << field
    field1 = FormField.new('form1[0].#subform[0].DateField1[0]', '07/03/0217')
    pdf.form_fields << field1
    field2 = FormField.new('form1[0].#subform[0].NumericField1[0]', '2594')
    pdf.form_fields << field2
    field3 = FormField.new('form1[0].#subform[0].DecimalField1[0]', '25.94')
    pdf.form_fields << field3
    field4 = FormField.new('form1[0].#subform[0].Subform1[0].CheckBox1[0]', '1')
    pdf.form_fields << field4
    field5 = FormField.new('form1[0].#subform[0].Subform1[0].CheckBox1[2]', '1')
    pdf.form_fields << field5
    field6 = FormField.new('form1[0].#subform[0].Subform1[1].RadioButtonList[1]', '1')
    pdf.form_fields << field6
    field7 = FormField.new('form1[0].#subform[0].ListBox1[0]', 'Full Time')
    pdf.form_fields << field7
    field8 = FormField.new('form1[0].#subform[0].DropDownList1[0]', 'Third')
    pdf.form_fields << field8

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples12.pdf", 'wb') { |file| file.write(response.content) }
    end
    File.open("#{OUTPUT_PATH}FormFillingSamples12.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputBytes_Xfa_Pdfoutput
    @name = 'XfaBytes'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new(("#{INPUT_PATH}All Fields Sample.pdf"))
    input = PdfInput.new(resource)

    pdf.inputs << input
    field = FormField.new('form1[0].#subform[0].TextField1[0]', 'text')
    pdf.form_fields << field
    field1 = FormField.new('form1[0].#subform[0].DateField1[0]', '07/03/0217')
    pdf.form_fields << field1
    field2 = FormField.new('form1[0].#subform[0].NumericField1[0]', '2594')
    pdf.form_fields << field2
    field3 = FormField.new('form1[0].#subform[0].DecimalField1[0]', '25.94')
    pdf.form_fields << field3
    field4 = FormField.new('form1[0].#subform[0].Subform1[0].CheckBox1[0]', '1')
    pdf.form_fields << field4
    field5 = FormField.new('form1[0].#subform[0].Subform1[0].CheckBox1[2]', '1')
    pdf.form_fields << field5
    field6 = FormField.new('form1[0].#subform[0].Subform1[1].RadioButtonList[1]', '1')
    pdf.form_fields << field6
    field7 = FormField.new('form1[0].#subform[0].ListBox1[0]', 'Full Time')
    pdf.form_fields << field7
    field8 = FormField.new('form1[0].#subform[0].DropDownList1[0]', 'Third')
    pdf.form_fields << field8

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples13.pdf", 'wb') { |file| file.write(response.content) }
    end
    File.open("#{OUTPUT_PATH}FormFillingSamples13.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputCloudRoot_Xfa_Pdfoutput
    @name = 'XfaCloudRoot'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('All Fields Sample.pdf')

    pdf.inputs << input
    field = FormField.new('form1[0].#subform[0].TextField1[0]', 'text')
    pdf.form_fields << field
    field1 = FormField.new('form1[0].#subform[0].DateField1[0]', '07/03/0217')
    pdf.form_fields << field1
    field2 = FormField.new('form1[0].#subform[0].NumericField1[0]', '2594')
    pdf.form_fields << field2
    field3 = FormField.new('form1[0].#subform[0].DecimalField1[0]', '25.94')
    pdf.form_fields << field3
    field4 = FormField.new('form1[0].#subform[0].Subform1[0].CheckBox1[0]', '1')
    pdf.form_fields << field4
    field5 = FormField.new('form1[0].#subform[0].Subform1[0].CheckBox1[2]', '1')
    pdf.form_fields << field5
    field6 = FormField.new('form1[0].#subform[0].Subform1[1].RadioButtonList[1]', '1')
    pdf.form_fields << field6
    field7 = FormField.new('form1[0].#subform[0].ListBox1[0]', 'Full Time')
    pdf.form_fields << field7
    field8 = FormField.new('form1[0].#subform[0].DropDownList1[0]', 'Third')
    pdf.form_fields << field8

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}FormFillingSamples14.pdf", 'wb') { |file| file.write(response.content) }
    end
    File.open("#{OUTPUT_PATH}FormFillingSamples14.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
