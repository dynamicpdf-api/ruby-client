module DynamicPDFApi
  #
  #
  # Specifies type of page zoom.
  #
  #
  class PageZoom
    #
    # Keep unchanged.
    #
    RETAIN = 'retain'.freeze

    #
    # Fit page in window.
    #
    FIT_PAGE = 'fitPage'.freeze

    #
    # Fit width of page in window.
    #
    FIT_WIDTH = 'fitWidth'.freeze

    #
    # Fit height of page in window.
    #
    FIT_HEIGHT = 'fitHeight'.freeze

    #
    # Fit all elements of page in window.
    #
    FIT_BOX = 'fitBox'.freeze
  end
end
