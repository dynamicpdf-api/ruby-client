module DynamicPDFApi
  #
  # Enum representing quantization algorithms.
  #
  class QuantizationAlgorithm
    #
    # Octree quantization algorithm.
    #
    Octree = :Octree.freeze

    #
    # Web-safe color quantization algorithm.
    #
    WebSafe = :WebSafe.freeze

    #
    # Werner quantization algorithm.
    #
    Werner = :Werner.freeze

    #
    # Wu quantization algorithm.
    #
    WU = :WU.freeze
  end
end
