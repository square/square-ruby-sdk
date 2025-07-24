# frozen_string_literal: true
require_relative "catalog_category_type"
require_relative "catalog_object_category"
require_relative "catalog_ecom_seo_data"
require_relative "category_path_to_root_node"
require "ostruct"
require "json"

module square.rb
# A category to which a `CatalogItem` instance belongs.
  class CatalogCategory
  # @return [String] The category name. This is a searchable attribute for use in applicable query
#  filters, and its value length is of Unicode code points.
    attr_reader :name
  # @return [Array<String>] The IDs of images associated with this `CatalogCategory` instance.
#  Currently these images are not displayed by Square, but are free to be displayed
#  in 3rd party applications.
    attr_reader :image_ids
  # @return [square.rb::CatalogCategoryType] The type of the category.
#  See [CatalogCategoryType](#type-catalogcategorytype) for possible values
    attr_reader :category_type
  # @return [square.rb::CatalogObjectCategory] The ID of the parent category of this category instance.
    attr_reader :parent_category
  # @return [Boolean] Indicates whether a category is a top level category, which does not have any
#  parent_category.
    attr_reader :is_top_level
  # @return [Array<String>] A list of IDs representing channels, such as a Square Online site, where the
#  category can be made visible.
    attr_reader :channels
  # @return [Array<String>] The IDs of the `CatalogAvailabilityPeriod` objects associated with the category.
    attr_reader :availability_period_ids
  # @return [Boolean] Indicates whether the category is visible (`true`) or hidden (`false`) on all of
#  the seller's Square Online sites.
    attr_reader :online_visibility
  # @return [String] The top-level category in a category hierarchy.
    attr_reader :root_category
  # @return [square.rb::CatalogEcomSeoData] The SEO data for a seller's Square Online store.
    attr_reader :ecom_seo_data
  # @return [Array<square.rb::CategoryPathToRootNode>] The path from the category to its root category. The first node of the path is
#  the parent of the category
#  and the last is the root category. The path is empty if the category is a root
#  category.
    attr_reader :path_to_root
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The category name. This is a searchable attribute for use in applicable query
#  filters, and its value length is of Unicode code points.
    # @param image_ids [Array<String>] The IDs of images associated with this `CatalogCategory` instance.
#  Currently these images are not displayed by Square, but are free to be displayed
#  in 3rd party applications.
    # @param category_type [square.rb::CatalogCategoryType] The type of the category.
#  See [CatalogCategoryType](#type-catalogcategorytype) for possible values
    # @param parent_category [square.rb::CatalogObjectCategory] The ID of the parent category of this category instance.
    # @param is_top_level [Boolean] Indicates whether a category is a top level category, which does not have any
#  parent_category.
    # @param channels [Array<String>] A list of IDs representing channels, such as a Square Online site, where the
#  category can be made visible.
    # @param availability_period_ids [Array<String>] The IDs of the `CatalogAvailabilityPeriod` objects associated with the category.
    # @param online_visibility [Boolean] Indicates whether the category is visible (`true`) or hidden (`false`) on all of
#  the seller's Square Online sites.
    # @param root_category [String] The top-level category in a category hierarchy.
    # @param ecom_seo_data [square.rb::CatalogEcomSeoData] The SEO data for a seller's Square Online store.
    # @param path_to_root [Array<square.rb::CategoryPathToRootNode>] The path from the category to its root category. The first node of the path is
#  the parent of the category
#  and the last is the root category. The path is empty if the category is a root
#  category.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogCategory]
    def initialize(name: OMIT, image_ids: OMIT, category_type: OMIT, parent_category: OMIT, is_top_level: OMIT, channels: OMIT, availability_period_ids: OMIT, online_visibility: OMIT, root_category: OMIT, ecom_seo_data: OMIT, path_to_root: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @image_ids = image_ids if image_ids != OMIT
      @category_type = category_type if category_type != OMIT
      @parent_category = parent_category if parent_category != OMIT
      @is_top_level = is_top_level if is_top_level != OMIT
      @channels = channels if channels != OMIT
      @availability_period_ids = availability_period_ids if availability_period_ids != OMIT
      @online_visibility = online_visibility if online_visibility != OMIT
      @root_category = root_category if root_category != OMIT
      @ecom_seo_data = ecom_seo_data if ecom_seo_data != OMIT
      @path_to_root = path_to_root if path_to_root != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "image_ids": image_ids, "category_type": category_type, "parent_category": parent_category, "is_top_level": is_top_level, "channels": channels, "availability_period_ids": availability_period_ids, "online_visibility": online_visibility, "root_category": root_category, "ecom_seo_data": ecom_seo_data, "path_to_root": path_to_root }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogCategory
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogCategory]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      image_ids = parsed_json["image_ids"]
      category_type = parsed_json["category_type"]
      unless parsed_json["parent_category"].nil?
        parent_category = parsed_json["parent_category"].to_json
        parent_category = square.rb::CatalogObjectCategory.from_json(json_object: parent_category)
      else
        parent_category = nil
      end
      is_top_level = parsed_json["is_top_level"]
      channels = parsed_json["channels"]
      availability_period_ids = parsed_json["availability_period_ids"]
      online_visibility = parsed_json["online_visibility"]
      root_category = parsed_json["root_category"]
      unless parsed_json["ecom_seo_data"].nil?
        ecom_seo_data = parsed_json["ecom_seo_data"].to_json
        ecom_seo_data = square.rb::CatalogEcomSeoData.from_json(json_object: ecom_seo_data)
      else
        ecom_seo_data = nil
      end
      path_to_root = parsed_json["path_to_root"]&.map do | item |
  item = item.to_json
  square.rb::CategoryPathToRootNode.from_json(json_object: item)
end
      new(
        name: name,
        image_ids: image_ids,
        category_type: category_type,
        parent_category: parent_category,
        is_top_level: is_top_level,
        channels: channels,
        availability_period_ids: availability_period_ids,
        online_visibility: online_visibility,
        root_category: root_category,
        ecom_seo_data: ecom_seo_data,
        path_to_root: path_to_root,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogCategory to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.image_ids&.is_a?(Array) != false || raise("Passed value for field obj.image_ids is not the expected type, validation failed.")
      obj.category_type&.is_a?(square.rb::CatalogCategoryType) != false || raise("Passed value for field obj.category_type is not the expected type, validation failed.")
      obj.parent_category.nil? || square.rb::CatalogObjectCategory.validate_raw(obj: obj.parent_category)
      obj.is_top_level&.is_a?(Boolean) != false || raise("Passed value for field obj.is_top_level is not the expected type, validation failed.")
      obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
      obj.availability_period_ids&.is_a?(Array) != false || raise("Passed value for field obj.availability_period_ids is not the expected type, validation failed.")
      obj.online_visibility&.is_a?(Boolean) != false || raise("Passed value for field obj.online_visibility is not the expected type, validation failed.")
      obj.root_category&.is_a?(String) != false || raise("Passed value for field obj.root_category is not the expected type, validation failed.")
      obj.ecom_seo_data.nil? || square.rb::CatalogEcomSeoData.validate_raw(obj: obj.ecom_seo_data)
      obj.path_to_root&.is_a?(Array) != false || raise("Passed value for field obj.path_to_root is not the expected type, validation failed.")
    end
  end
end