require "minitest/autorun"
require "ruby_client"
require_relative './../../TestParameters'

class SecuritySamplesTest < Minitest::Test
  include DynamicPDFApi

  INPUT_PATH = TestParameters::INPUT_PATH
  OUTPUT_PATH = TestParameters::OUTPUT_PATH
  KEY = TestParameters::API_KEY
  URL = TestParameters::BASE_URL
  AUTHOR = TestParameters::AUTHOR
  TITLE = TestParameters::TITLE

  def test_PdfInputFilePathAes256Security_PdfOutput
    @name = 'PdfInputFilePathAes256Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    security = Aes256Security.new('user', 'owner')
    pdf.security = security

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples1.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples1.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputBytesAes256Security_PdfOutput
    @name = 'PdfInputBytesAes256Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}XmpAndOtherSample.pdf", 'rb')

    resource = PdfResource.new(file.read.unpack('C*'))
    input = PdfInput.new(resource)
    pdf.inputs << input

    security = Aes256Security.new('user', 'owner')
    pdf.security = security

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples2.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples2.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputStream_Aes256Security_PdfOutput
    @name = 'PdfInputStreamAes256Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    file = File.open("#{INPUT_PATH}XmpAndOtherSample.pdf", 'rb')
    resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(resource)
    pdf.inputs << input

    security = Aes256Security.new('user', 'owner')
    pdf.security = security

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples3.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples3.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputCloudRoot_Aes256Security_PdfOutput
    @name = 'PdfInputCloudRootAes256Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('XmpAndOtherSample.pdf')
    pdf.inputs << input

    security = Aes256Security.new('user', 'owner')
    pdf.security = security

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples4.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples4.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputSubFolder_Aes256Security_PdfOutput
    @name = 'PdfInputCloudSubFolderAes256Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PdfInput.new('Resources/XmpAndOtherSample.pdf')
    pdf.inputs << input

    security = Aes256Security.new('user', 'owner')
    pdf.security = security

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples5.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples5.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_Aes256Security_PdfOutput
    @name = 'PageInputAes256Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    input = PageInput.new
    pdf.inputs << input

    security = Aes256Security.new('user', 'owner')
    pdf.security = security

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples6.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples6.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInpuAes256SecurityOwnerPassword_PdfOutput
    @name = 'PdfInputAes256SecurityOwnerPassword'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    security = Aes256Security.new('', 'owner')
    pdf.security = security

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples7.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples7.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputAes256SecurityAllowFormFillingAndOtherProperties_PdfOutput
    @name = 'PdfInputAes256SecurityFormFilling'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes256Security.new('user', 'owner')
    security.allow_form_filling = false
    security.allow_update_annots_and_fields = false
    security.allow_edit = false
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples8.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples8.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputAes256SecurityAllowPrintAndOtherProperties_PdfOutput
    @name = 'PdfInputAes256SecurityAllowPrint'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes256Security.new('user', 'owner')
    security.allow_high_resolution_printing = true
    security.allow_print = true
    security.allow_copy = true
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples9.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples9.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputFilePath_Aes256SecurityOwnerUserPassword_PdfOutput
    @name = 'PdfInputAes256SecurityOwnerUserPassword'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes256Security.new('', '')
    security.allow_accessibility = true
    security.allow_document_assembly = false
    security.allow_edit = false
    security.owner_password = 'owner'
    security.user_password = 'user'
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples10.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples10.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInput_Aes256SecurityDocumentComponentsAll_PdfOutput
    @name = 'PdfInputAes256SecurityDocumentComponentsAll'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes256Security.new('user', 'owner')
    security.document_components = EncryptDocumentComponents::ALL
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples11.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples11.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes256SecurityDocumentComponentsAllExceptMetadata_PdfOutput
    @name = 'PdfInputAes256SecurityDocumentComponentsAllExceptMetadata'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes256Security.new('user', 'owner')
    security.document_components = EncryptDocumentComponents::ALL_EXCEPT_METADATA
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples12.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples12.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes256SecurityWithoutPassword_PdfOutput
    @name = 'PdfInputAes256SecurityWithoutPassword'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes256Security.new('', '')
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples13.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples13.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes128Security_PdfOutput
    @name = 'PdfInputFilePathAes128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples14.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples14.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingBytes_Aes128Security_PdfOutput
    @name = 'PdfInputBytesPathAes128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    pdf.security = security

    file = File.open("#{INPUT_PATH}XmpAndOtherSample.pdf", 'rb')

    resource = PdfResource.new(file.read.unpack('C*'))

    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples15.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples15.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingStream_Aes128Security_PdfOutput
    @name = 'PdfInputStreamPathAes128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    pdf.security = security

    file = File.open("#{INPUT_PATH}XmpAndOtherSample.pdf", 'rb')
    resource = PdfResource.new(file)
    file.close

    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples16.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples16.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudRoot_Aes128Security_PdfOutput
    @name = 'PdfInputCloudRootPathAes128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    pdf.security = security

    input = PdfInput.new('XmpAndOtherSample.pdf')
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples17.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples17.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudSubFolder_Aes128Security_PdfOutput
    @name = 'PdfInputCloudSubFolderPathAes128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')

    input = PdfInput.new('Resources/XmpAndOtherSample.pdf')

    pdf.inputs << input
    pdf.security = security

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples18.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples18.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_Aes128Security_PdfOutput
    @name = 'PageInputAes128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    pdf.security = security

    input = PageInput.new
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples19.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples19.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes128SecurityOwnerPassword_PdfOutput
    @name = 'PdfInputAes128SecurityOwnerPassword'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('', 'owner')
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples20.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples20.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes128SecurityAllowFormFillingAndOtherProperties_PdfOutput
    @name = 'PdfInputAes128SecurityAllowFormFillingAndOtherProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    security.allow_form_filling = false
    security.allow_update_annots_and_fields = false
    security.allow_edit = false
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples21.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples21.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes128SecurityAllowPrintAndOtherProperties_PdfOutput
    @name = 'PdfInputAes128SecurityAllowFormFillingAndOtherProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    security.allow_high_resolution_printing = true
    security.allow_print = true
    security.allow_copy = true
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples22.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples22.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes128SecurityUserOwnerPassword_PdfOutput
    @name = 'PdfInputAes128SecurityUserOwnerPassword'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('', '')
    security.allow_accessibility = true
    security.allow_document_assembly = false
    security.allow_edit = false
    security.owner_password = 'owner'
    security.user_password = 'user'
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples23.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples23.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes128SecurityDocumentComponentsAll_PdfOutput
    @name = 'PdfInputAes128SecurityDocumentComponentsAll'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    security.document_components = EncryptDocumentComponents::ALL
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples24.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples24.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes128SecurityDocumentComponentsAllExceptMetadata_PdfOutput
    @name = 'PdfInputAes128SecurityDocumentComponentsAllExceptMetadata'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('user', 'owner')
    security.document_components = EncryptDocumentComponents::ALL_EXCEPT_METADATA
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples25.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples25.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_Aes128SecurityWithoutPassword_PdfOutput
    @name = 'PdfInputAes128SecurityWithoutPassword'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = Aes128Security.new('', '')
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples26.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples26.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_RC4128Security_PdfOutput
    @name = 'PdfInputRC4128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples27.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples27.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingBytes_RC4128Security_PdfOutput
    @name = 'PdfInputBytesRC4128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    pdf.security = security

    file = File.open("#{INPUT_PATH}XmpAndOtherSample.pdf", 'rb')

    resource = PdfResource.new(file.read.unpack('C*'))

    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples28.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples28.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingStream_RC4128Security_PdfOutput
    @name = 'PdfInputStreamRC4128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples29.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples29.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudRoot_RC4128Security_PdfOutput
    @name = 'PdfInputCloudRootRC4128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    pdf.security = security

    input = PdfInput.new('XmpAndOtherSample.pdf')
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples30.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples30.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingCloudSubFolder_RC4128Security_PdfOutput
    @name = 'PdfInputCloudSubFolderRC4128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    pdf.security = security

    input = PdfInput.new('Resources/XmpAndOtherSample.pdf')
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples31.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples31.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PageInput_RC4128Security_PdfOutput
    @name = 'PageInputRC4128Security'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    pdf.security = security

    input = PageInput.new
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples32.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples32.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_RC4128SecurityOwnerPassword_PdfOutput
    @name = 'PdfInputRC4128SecurityOwnerPassword'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('', 'owner')
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples33.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples33.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_RC4128SecurityAllowFormFillingAndOtherProperties_PdfOutput
    @name = 'PdfInputRC4128SecurityAllowFormFillingAndOtherProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    security.allow_form_filling = false
    security.allow_update_annots_and_fields = false
    security.allow_edit = false
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples34.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples34.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_RC4128SecurityAllowPrintAndOtherProperties_PdfOutput
    @name = 'PdfInputRC4128SecurityAllowPrintAndOtherProperties'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    security.allow_high_resolution_printing = true
    security.allow_print = true
    security.allow_copy = true
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)

    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples35.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples35.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_RC4128SecurityOwnerUserPassword_PdfOutput
    @name = 'PdfInputRC4128SecurityOwnerUserPassword'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('', '')
    security.allow_accessibility = true
    security.allow_document_assembly = false
    security.allow_edit = false
    security.owner_password = 'owner'
    security.user_password = 'user'
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples36.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples36.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_RC4128SecurityEncryptMetadata_PdfOutput
    @name = 'PdfInputRC4128SecurityEncryptMetadata'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    security.encrypt_metadata = true
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples37.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples37.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end

  def test_PdfInputUsingFilePath_RC4128SecurityEncryptExceptMetadata_PdfOutput
    @name = 'PdfInputRC4128SecurityEncryptExceptMetadata'

    pdf = Pdf.new
    pdf.api_key = KEY
    pdf.base_url = URL

    pdf.author = AUTHOR
    pdf.title = TITLE

    security = RC4128Security.new('user', 'owner')
    security.encrypt_metadata = false
    pdf.security = security

    resource = PdfResource.new("#{INPUT_PATH}XmpAndOtherSample.pdf")
    input = PdfInput.new(resource)
    pdf.inputs << input

    response = pdf.process

    if response.is_successful
      File.open("#{OUTPUT_PATH}SecuritySamples38.pdf", 'wb') { |file| file.write(response.content) }
    end

    File.open("#{OUTPUT_PATH}SecuritySamples38.json", 'w') { |file| file.write(pdf.get_instructions_json) }

    assert response.is_successful, response.error_message
  end
end
