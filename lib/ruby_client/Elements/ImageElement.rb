module DynamicPDFApi
  require_relative 'Element'
  require_relative 'ElementType'

  #
  # Represents an image element.
  #
  # This class can be used to place images on a page.
  #
  class ImageElement < Element
    #
    # Initializes a new instance of the ImageElement class.
    #
    # @param resource [ImageResource]|[String] ImageResource object containing the image resource or the name of the image resource.
    # @param placement [String] The placement of the image on the page.
    # @param x_offset [float] X coordinate of the image.
    # @param y_offset [float] Y coordinate of the image.
    #
    def initialize(resource, placement= ElementPlacement::TOP_LEFT, x_offset = 0, y_offset = 0)
      super()
      @_type = ElementType::IMAGE
      @_resource = nil
      @_resource_name = nil

      if resource.is_a?(String)
        @_resource_name = resource
      else
        # super()
        @_resource = resource
        @_resource_name = resource.resource_name
      end

      @placement = placement
      @x_offset = x_offset
      @y_offset = y_offset
    end

    #
    # Initializes a new instance of the ImageElement class.
    #
    # @param resourceName [String] The name of the image resource.
    # @param placement [String] The placement of the image on the page.
    # @param x_offset [float] X coordinate of the image.
    # @param y_offset [float] Y coordinate of the image.
    #
    # @return ImageElement returns ImageElement object.
    #
    def self.create_image_element(resource_name, placement, x_offset = 0, y_offset = 0)
      image_element = new ImageElement(nil, nil)
      image_element._resource_name = resource_name
      image_element.placement = placement
      image_element.x_offset = x_offset
      image_element.y_offset = y_offset
      image_element
    end

    attr_accessor :_resource_name

    #
    # Gets or sets the horizontal scale of the image.
    #
    attr_accessor :scale_x

    #
    # Gets or sets the vertical scale of the image.
    #
    attr_accessor :scale_y

    #
    # Gets or sets the maximum height of the image.
    #
    attr_accessor :max_height

    #
    # Gets or sets the maximum width of the image.
    #
    attr_accessor :max_width

    def to_json(_options = {})
      json_array = {}
      json_array['type'] = 'image'

      json_array['resourceName'] = @_resource_name unless @_resource_name.nil?

      json_array['scaleX'] = @scale_x unless @scale_x.nil?

      json_array['scaleY'] = @scale_y unless @scale_y.nil?

      json_array['maxHeight'] = @max_height unless @max_height.nil?

      json_array['maxWidth'] = @max_width unless @max_width.nil?

      # ---------------------------------

      json_array['placement'] = @placement unless @placement.nil?

      json_array['xOffset'] = @x_offset unless @x_offset.nil?

      json_array['yOffset'] = @y_offset unless @y_offset.nil?

      json_array['evenPages'] = @even_pages unless @even_pages.nil?

      json_array['oddPages'] = @odd_pages unless @odd_pages.nil?

      JSON.pretty_generate(json_array)
    end
  end
end
