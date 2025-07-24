# frozen_string_literal: true
require_relative "product"
require "ostruct"
require "json"

module square.rb
# Represents information about the application used to generate a change.
  class SourceApplication
  # @return [square.rb::Product] __Read only__ The [product](entity:Product) type of the application.
#  See [Product](#type-product) for possible values
    attr_reader :product
  # @return [String] __Read only__ The Square-assigned ID of the application. This field is used only
#  if the
#  [product](entity:Product) type is `EXTERNAL_API`.
    attr_reader :application_id
  # @return [String] __Read only__ The display name of the application
#  (for example, `"Custom Application"` or `"Square POS 4.74 for Android"`).
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param product [square.rb::Product] __Read only__ The [product](entity:Product) type of the application.
#  See [Product](#type-product) for possible values
    # @param application_id [String] __Read only__ The Square-assigned ID of the application. This field is used only
#  if the
#  [product](entity:Product) type is `EXTERNAL_API`.
    # @param name [String] __Read only__ The display name of the application
#  (for example, `"Custom Application"` or `"Square POS 4.74 for Android"`).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SourceApplication]
    def initialize(product: OMIT, application_id: OMIT, name: OMIT, additional_properties: nil)
      @product = product if product != OMIT
      @application_id = application_id if application_id != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "product": product, "application_id": application_id, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SourceApplication
    #
    # @param json_object [String] 
    # @return [square.rb::SourceApplication]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      product = parsed_json["product"]
      application_id = parsed_json["application_id"]
      name = parsed_json["name"]
      new(
        product: product,
        application_id: application_id,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of SourceApplication to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.product&.is_a?(square.rb::Product) != false || raise("Passed value for field obj.product is not the expected type, validation failed.")
      obj.application_id&.is_a?(String) != false || raise("Passed value for field obj.application_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end