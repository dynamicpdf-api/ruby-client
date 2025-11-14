module DynamicPDFApi
  #
  # Specifies Encryption Type.
  #
  class EncryptionType
    #
    # RC4 40 bit security.
    #
    RC440 = 'rc440'.freeze

    #
    # RC4 128 bit security.
    #
    RC4128 = 'rc4128'.freeze

    #
    # AES 128 bit security with CBC cipher mode.
    #
    AES128CBC = 'aes128cbc'.freeze

    #
    # AES 256 bit security with CBC cipher mode.
    #
    AES256CBC = 'aes256cbc'.freeze

    #
    # No security.
    #
    NONE = 'none'.freeze
  end
end
