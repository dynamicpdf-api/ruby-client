module DynamicPDFApi
  #
  # Specifies the document components to be encrypted.
  #
  class EncryptDocumentComponents
    #
    # Encrypts all document contents.
    #
    ALL = 'all'

    #
    # Encrypts all document contents except metadata.
    #
    ALL_EXCEPT_METADATA = 'allExceptMetadata'
  end
end
