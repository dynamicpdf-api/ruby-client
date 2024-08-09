module DynamicPDFApi
  #
  # Enum representing dithering algorithms.
  #
  class DitheringAlgorithm
    #
    # Floyd-Steinberg dithering algorithm.
    #
    FloydSteinberg = :FloydSteinberg.freeze

    #
    # Bayer dithering algorithm.
    #
    Bayer = :Bayer.freeze

    #
    # No dithering.
    #
    None = :None.freeze
  end
end
