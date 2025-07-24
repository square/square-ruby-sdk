# frozen_string_literal: true
require_relative "catalog_item_modifier_list_info"
require_relative "catalog_object"
require_relative "catalog_item_product_type"
require_relative "catalog_item_option_for_item"
require_relative "catalog_object_category"
require_relative "catalog_ecom_seo_data"
require_relative "catalog_item_food_and_beverage_details"
require "ostruct"
require "json"

module square.rb
# A [CatalogObject](entity:CatalogObject) instance of the `ITEM` type, also
#  referred to as an item, in the catalog.
  class CatalogItem
  # @return [String] The item's name. This is a searchable attribute for use in applicable query
#  filters, its value must not be empty, and the length is of Unicode code points.
    attr_reader :name
  # @return [String] The item's description. This is a searchable attribute for use in applicable
#  query filters, and its value length is of Unicode code points.
#  Deprecated at 2022-07-20, this field is planned to retire in 6 months. You
#  should migrate to use `description_html` to set the description
#  of the [CatalogItem](entity:CatalogItem) instance.  The `description` and
#  `description_html` field values are kept in sync. If you try to
#  set the both fields, the `description_html` text value overwrites the
#  `description` value. Updates in one field are also reflected in the other,
#  except for when you use an early version before Square API 2022-07-20 and
#  `description_html` is set to blank, setting the `description` value to null
#  does not nullify `description_html`.
    attr_reader :description
  # @return [String] The text of the item's display label in the Square Point of Sale app. Only up to
#  the first five characters of the string are used.
#  This attribute is searchable, and its value length is of Unicode code points.
    attr_reader :abbreviation
  # @return [String] The color of the item's display label in the Square Point of Sale app. This must
#  be a valid hex color code.
    attr_reader :label_color
  # @return [Boolean] Indicates whether the item is taxable (`true`) or non-taxable (`false`). Default
#  is `true`.
    attr_reader :is_taxable
  # @return [String] The ID of the item's category, if any. Deprecated since 2023-12-13. Use
#  `CatalogItem.categories`, instead.
    attr_reader :category_id
  # @return [Array<String>] A set of IDs indicating the taxes enabled for
#  this item. When updating an item, any taxes listed here will be added to the
#  item.
#  Taxes may also be added to or deleted from an item using `UpdateItemTaxes`.
    attr_reader :tax_ids
  # @return [Array<square.rb::CatalogItemModifierListInfo>] A set of `CatalogItemModifierListInfo` objects
#  representing the modifier lists that apply to this item, along with the
#  overrides and min
#  and max limits that are specific to this item. Modifier lists
#  may also be added to or deleted from an item using `UpdateItemModifierLists`.
    attr_reader :modifier_list_info
  # @return [Array<square.rb::CatalogObject>] A list of [CatalogItemVariation](entity:CatalogItemVariation) objects for this
#  item. An item must have
#  at least one variation.
    attr_reader :variations
  # @return [square.rb::CatalogItemProductType] The product type of the item. Once set, the `product_type` value cannot be
#  modified.
#  Items of the `LEGACY_SQUARE_ONLINE_SERVICE` and
#  `LEGACY_SQUARE_ONLINE_MEMBERSHIP` product types can be updated
#  but cannot be created using the API.
#  See [CatalogItemProductType](#type-catalogitemproducttype) for possible values
    attr_reader :product_type
  # @return [Boolean] If `false`, the Square Point of Sale app will present the `CatalogItem`'s
#  details screen immediately, allowing the merchant to choose `CatalogModifier`s
#  before adding the item to the cart.  This is the default behavior.
#  If `true`, the Square Point of Sale app will immediately add the item to the
#  cart with the pre-selected
#  modifiers, and merchants can edit modifiers by drilling down onto the item's
#  details.
#  Third-party clients are encouraged to implement similar behaviors.
    attr_reader :skip_modifier_screen
  # @return [Array<square.rb::CatalogItemOptionForItem>] List of item options IDs for this item. Used to manage and group item
#  variations in a specified order.
#  Maximum: 6 item options.
    attr_reader :item_options
  # @return [String] Deprecated. A URI pointing to a published e-commerce product page for the Item.
    attr_reader :ecom_uri
  # @return [Array<String>] Deprecated. A comma-separated list of encoded URIs pointing to a set of
#  published e-commerce images for the Item.
    attr_reader :ecom_image_uris
  # @return [Array<String>] The IDs of images associated with this `CatalogItem` instance.
#  These images will be shown to customers in Square Online Store.
#  The first image will show up as the icon for this item in POS.
    attr_reader :image_ids
  # @return [String] A name to sort the item by. If this name is unspecified, namely, the `sort_name`
#  field is absent, the regular `name` field is used for sorting.
#  Its value must not be empty.
#  It is currently supported for sellers of the Japanese locale only.
    attr_reader :sort_name
  # @return [Array<square.rb::CatalogObjectCategory>] The list of categories.
    attr_reader :categories
  # @return [String] The item's description as expressed in valid HTML elements. The length of this
#  field value, including those of HTML tags,
#  is of Unicode points. With application query filters, the text values of the
#  HTML elements and attributes are searchable. Invalid or
#  unsupported HTML elements or attributes are ignored.
#  Supported HTML elements include:
#  - `a`: Link. Supports linking to website URLs, email address, and telephone
#  numbers.
#  - `b`, `strong`:  Bold text
#  - `br`: Line break
#  - `code`: Computer code
#  - `div`: Section
#  - `h1-h6`: Headings
#  - `i`, `em`: Italics
#  - `li`: List element
#  - `ol`: Numbered list
#  - `p`: Paragraph
#  - `ul`: Bullet list
#  - `u`: Underline
#  Supported HTML attributes include:
#  - `align`: Alignment of the text content
#  - `href`: Link destination
#  - `rel`: Relationship between link's target and source
#  - `target`: Place to open the linked document
    attr_reader :description_html
  # @return [String] A server-generated plaintext version of the `description_html` field, without
#  formatting tags.
    attr_reader :description_plaintext
  # @return [Array<String>] A list of IDs representing channels, such as a Square Online site, where the
#  item can be made visible or available.
#  This field is read only and cannot be edited.
    attr_reader :channels
  # @return [Boolean] Indicates whether this item is archived (`true`) or not (`false`).
    attr_reader :is_archived
  # @return [square.rb::CatalogEcomSeoData] The SEO data for a seller's Square Online store.
    attr_reader :ecom_seo_data
  # @return [square.rb::CatalogItemFoodAndBeverageDetails] The food and beverage-specific details for the `FOOD_AND_BEV` item.
    attr_reader :food_and_beverage_details
  # @return [square.rb::CatalogObjectCategory] The item's reporting category.
    attr_reader :reporting_category
  # @return [Boolean] Indicates whether this item is alcoholic (`true`) or not (`false`).
    attr_reader :is_alcoholic
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The item's name. This is a searchable attribute for use in applicable query
#  filters, its value must not be empty, and the length is of Unicode code points.
    # @param description [String] The item's description. This is a searchable attribute for use in applicable
#  query filters, and its value length is of Unicode code points.
#  Deprecated at 2022-07-20, this field is planned to retire in 6 months. You
#  should migrate to use `description_html` to set the description
#  of the [CatalogItem](entity:CatalogItem) instance.  The `description` and
#  `description_html` field values are kept in sync. If you try to
#  set the both fields, the `description_html` text value overwrites the
#  `description` value. Updates in one field are also reflected in the other,
#  except for when you use an early version before Square API 2022-07-20 and
#  `description_html` is set to blank, setting the `description` value to null
#  does not nullify `description_html`.
    # @param abbreviation [String] The text of the item's display label in the Square Point of Sale app. Only up to
#  the first five characters of the string are used.
#  This attribute is searchable, and its value length is of Unicode code points.
    # @param label_color [String] The color of the item's display label in the Square Point of Sale app. This must
#  be a valid hex color code.
    # @param is_taxable [Boolean] Indicates whether the item is taxable (`true`) or non-taxable (`false`). Default
#  is `true`.
    # @param category_id [String] The ID of the item's category, if any. Deprecated since 2023-12-13. Use
#  `CatalogItem.categories`, instead.
    # @param tax_ids [Array<String>] A set of IDs indicating the taxes enabled for
#  this item. When updating an item, any taxes listed here will be added to the
#  item.
#  Taxes may also be added to or deleted from an item using `UpdateItemTaxes`.
    # @param modifier_list_info [Array<square.rb::CatalogItemModifierListInfo>] A set of `CatalogItemModifierListInfo` objects
#  representing the modifier lists that apply to this item, along with the
#  overrides and min
#  and max limits that are specific to this item. Modifier lists
#  may also be added to or deleted from an item using `UpdateItemModifierLists`.
    # @param variations [Array<square.rb::CatalogObject>] A list of [CatalogItemVariation](entity:CatalogItemVariation) objects for this
#  item. An item must have
#  at least one variation.
    # @param product_type [square.rb::CatalogItemProductType] The product type of the item. Once set, the `product_type` value cannot be
#  modified.
#  Items of the `LEGACY_SQUARE_ONLINE_SERVICE` and
#  `LEGACY_SQUARE_ONLINE_MEMBERSHIP` product types can be updated
#  but cannot be created using the API.
#  See [CatalogItemProductType](#type-catalogitemproducttype) for possible values
    # @param skip_modifier_screen [Boolean] If `false`, the Square Point of Sale app will present the `CatalogItem`'s
#  details screen immediately, allowing the merchant to choose `CatalogModifier`s
#  before adding the item to the cart.  This is the default behavior.
#  If `true`, the Square Point of Sale app will immediately add the item to the
#  cart with the pre-selected
#  modifiers, and merchants can edit modifiers by drilling down onto the item's
#  details.
#  Third-party clients are encouraged to implement similar behaviors.
    # @param item_options [Array<square.rb::CatalogItemOptionForItem>] List of item options IDs for this item. Used to manage and group item
#  variations in a specified order.
#  Maximum: 6 item options.
    # @param ecom_uri [String] Deprecated. A URI pointing to a published e-commerce product page for the Item.
    # @param ecom_image_uris [Array<String>] Deprecated. A comma-separated list of encoded URIs pointing to a set of
#  published e-commerce images for the Item.
    # @param image_ids [Array<String>] The IDs of images associated with this `CatalogItem` instance.
#  These images will be shown to customers in Square Online Store.
#  The first image will show up as the icon for this item in POS.
    # @param sort_name [String] A name to sort the item by. If this name is unspecified, namely, the `sort_name`
#  field is absent, the regular `name` field is used for sorting.
#  Its value must not be empty.
#  It is currently supported for sellers of the Japanese locale only.
    # @param categories [Array<square.rb::CatalogObjectCategory>] The list of categories.
    # @param description_html [String] The item's description as expressed in valid HTML elements. The length of this
#  field value, including those of HTML tags,
#  is of Unicode points. With application query filters, the text values of the
#  HTML elements and attributes are searchable. Invalid or
#  unsupported HTML elements or attributes are ignored.
#  Supported HTML elements include:
#  - `a`: Link. Supports linking to website URLs, email address, and telephone
#  numbers.
#  - `b`, `strong`:  Bold text
#  - `br`: Line break
#  - `code`: Computer code
#  - `div`: Section
#  - `h1-h6`: Headings
#  - `i`, `em`: Italics
#  - `li`: List element
#  - `ol`: Numbered list
#  - `p`: Paragraph
#  - `ul`: Bullet list
#  - `u`: Underline
#  Supported HTML attributes include:
#  - `align`: Alignment of the text content
#  - `href`: Link destination
#  - `rel`: Relationship between link's target and source
#  - `target`: Place to open the linked document
    # @param description_plaintext [String] A server-generated plaintext version of the `description_html` field, without
#  formatting tags.
    # @param channels [Array<String>] A list of IDs representing channels, such as a Square Online site, where the
#  item can be made visible or available.
#  This field is read only and cannot be edited.
    # @param is_archived [Boolean] Indicates whether this item is archived (`true`) or not (`false`).
    # @param ecom_seo_data [square.rb::CatalogEcomSeoData] The SEO data for a seller's Square Online store.
    # @param food_and_beverage_details [square.rb::CatalogItemFoodAndBeverageDetails] The food and beverage-specific details for the `FOOD_AND_BEV` item.
    # @param reporting_category [square.rb::CatalogObjectCategory] The item's reporting category.
    # @param is_alcoholic [Boolean] Indicates whether this item is alcoholic (`true`) or not (`false`).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogItem]
    def initialize(name: OMIT, description: OMIT, abbreviation: OMIT, label_color: OMIT, is_taxable: OMIT, category_id: OMIT, tax_ids: OMIT, modifier_list_info: OMIT, variations: OMIT, product_type: OMIT, skip_modifier_screen: OMIT, item_options: OMIT, ecom_uri: OMIT, ecom_image_uris: OMIT, image_ids: OMIT, sort_name: OMIT, categories: OMIT, description_html: OMIT, description_plaintext: OMIT, channels: OMIT, is_archived: OMIT, ecom_seo_data: OMIT, food_and_beverage_details: OMIT, reporting_category: OMIT, is_alcoholic: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @description = description if description != OMIT
      @abbreviation = abbreviation if abbreviation != OMIT
      @label_color = label_color if label_color != OMIT
      @is_taxable = is_taxable if is_taxable != OMIT
      @category_id = category_id if category_id != OMIT
      @tax_ids = tax_ids if tax_ids != OMIT
      @modifier_list_info = modifier_list_info if modifier_list_info != OMIT
      @variations = variations if variations != OMIT
      @product_type = product_type if product_type != OMIT
      @skip_modifier_screen = skip_modifier_screen if skip_modifier_screen != OMIT
      @item_options = item_options if item_options != OMIT
      @ecom_uri = ecom_uri if ecom_uri != OMIT
      @ecom_image_uris = ecom_image_uris if ecom_image_uris != OMIT
      @image_ids = image_ids if image_ids != OMIT
      @sort_name = sort_name if sort_name != OMIT
      @categories = categories if categories != OMIT
      @description_html = description_html if description_html != OMIT
      @description_plaintext = description_plaintext if description_plaintext != OMIT
      @channels = channels if channels != OMIT
      @is_archived = is_archived if is_archived != OMIT
      @ecom_seo_data = ecom_seo_data if ecom_seo_data != OMIT
      @food_and_beverage_details = food_and_beverage_details if food_and_beverage_details != OMIT
      @reporting_category = reporting_category if reporting_category != OMIT
      @is_alcoholic = is_alcoholic if is_alcoholic != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "description": description, "abbreviation": abbreviation, "label_color": label_color, "is_taxable": is_taxable, "category_id": category_id, "tax_ids": tax_ids, "modifier_list_info": modifier_list_info, "variations": variations, "product_type": product_type, "skip_modifier_screen": skip_modifier_screen, "item_options": item_options, "ecom_uri": ecom_uri, "ecom_image_uris": ecom_image_uris, "image_ids": image_ids, "sort_name": sort_name, "categories": categories, "description_html": description_html, "description_plaintext": description_plaintext, "channels": channels, "is_archived": is_archived, "ecom_seo_data": ecom_seo_data, "food_and_beverage_details": food_and_beverage_details, "reporting_category": reporting_category, "is_alcoholic": is_alcoholic }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogItem
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      description = parsed_json["description"]
      abbreviation = parsed_json["abbreviation"]
      label_color = parsed_json["label_color"]
      is_taxable = parsed_json["is_taxable"]
      category_id = parsed_json["category_id"]
      tax_ids = parsed_json["tax_ids"]
      modifier_list_info = parsed_json["modifier_list_info"]&.map do | item |
  item = item.to_json
  square.rb::CatalogItemModifierListInfo.from_json(json_object: item)
end
      variations = parsed_json["variations"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObject.from_json(json_object: item)
end
      product_type = parsed_json["product_type"]
      skip_modifier_screen = parsed_json["skip_modifier_screen"]
      item_options = parsed_json["item_options"]&.map do | item |
  item = item.to_json
  square.rb::CatalogItemOptionForItem.from_json(json_object: item)
end
      ecom_uri = parsed_json["ecom_uri"]
      ecom_image_uris = parsed_json["ecom_image_uris"]
      image_ids = parsed_json["image_ids"]
      sort_name = parsed_json["sort_name"]
      categories = parsed_json["categories"]&.map do | item |
  item = item.to_json
  square.rb::CatalogObjectCategory.from_json(json_object: item)
end
      description_html = parsed_json["description_html"]
      description_plaintext = parsed_json["description_plaintext"]
      channels = parsed_json["channels"]
      is_archived = parsed_json["is_archived"]
      unless parsed_json["ecom_seo_data"].nil?
        ecom_seo_data = parsed_json["ecom_seo_data"].to_json
        ecom_seo_data = square.rb::CatalogEcomSeoData.from_json(json_object: ecom_seo_data)
      else
        ecom_seo_data = nil
      end
      unless parsed_json["food_and_beverage_details"].nil?
        food_and_beverage_details = parsed_json["food_and_beverage_details"].to_json
        food_and_beverage_details = square.rb::CatalogItemFoodAndBeverageDetails.from_json(json_object: food_and_beverage_details)
      else
        food_and_beverage_details = nil
      end
      unless parsed_json["reporting_category"].nil?
        reporting_category = parsed_json["reporting_category"].to_json
        reporting_category = square.rb::CatalogObjectCategory.from_json(json_object: reporting_category)
      else
        reporting_category = nil
      end
      is_alcoholic = parsed_json["is_alcoholic"]
      new(
        name: name,
        description: description,
        abbreviation: abbreviation,
        label_color: label_color,
        is_taxable: is_taxable,
        category_id: category_id,
        tax_ids: tax_ids,
        modifier_list_info: modifier_list_info,
        variations: variations,
        product_type: product_type,
        skip_modifier_screen: skip_modifier_screen,
        item_options: item_options,
        ecom_uri: ecom_uri,
        ecom_image_uris: ecom_image_uris,
        image_ids: image_ids,
        sort_name: sort_name,
        categories: categories,
        description_html: description_html,
        description_plaintext: description_plaintext,
        channels: channels,
        is_archived: is_archived,
        ecom_seo_data: ecom_seo_data,
        food_and_beverage_details: food_and_beverage_details,
        reporting_category: reporting_category,
        is_alcoholic: is_alcoholic,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogItem to a JSON object
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
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.abbreviation&.is_a?(String) != false || raise("Passed value for field obj.abbreviation is not the expected type, validation failed.")
      obj.label_color&.is_a?(String) != false || raise("Passed value for field obj.label_color is not the expected type, validation failed.")
      obj.is_taxable&.is_a?(Boolean) != false || raise("Passed value for field obj.is_taxable is not the expected type, validation failed.")
      obj.category_id&.is_a?(String) != false || raise("Passed value for field obj.category_id is not the expected type, validation failed.")
      obj.tax_ids&.is_a?(Array) != false || raise("Passed value for field obj.tax_ids is not the expected type, validation failed.")
      obj.modifier_list_info&.is_a?(Array) != false || raise("Passed value for field obj.modifier_list_info is not the expected type, validation failed.")
      obj.variations&.is_a?(Array) != false || raise("Passed value for field obj.variations is not the expected type, validation failed.")
      obj.product_type&.is_a?(square.rb::CatalogItemProductType) != false || raise("Passed value for field obj.product_type is not the expected type, validation failed.")
      obj.skip_modifier_screen&.is_a?(Boolean) != false || raise("Passed value for field obj.skip_modifier_screen is not the expected type, validation failed.")
      obj.item_options&.is_a?(Array) != false || raise("Passed value for field obj.item_options is not the expected type, validation failed.")
      obj.ecom_uri&.is_a?(String) != false || raise("Passed value for field obj.ecom_uri is not the expected type, validation failed.")
      obj.ecom_image_uris&.is_a?(Array) != false || raise("Passed value for field obj.ecom_image_uris is not the expected type, validation failed.")
      obj.image_ids&.is_a?(Array) != false || raise("Passed value for field obj.image_ids is not the expected type, validation failed.")
      obj.sort_name&.is_a?(String) != false || raise("Passed value for field obj.sort_name is not the expected type, validation failed.")
      obj.categories&.is_a?(Array) != false || raise("Passed value for field obj.categories is not the expected type, validation failed.")
      obj.description_html&.is_a?(String) != false || raise("Passed value for field obj.description_html is not the expected type, validation failed.")
      obj.description_plaintext&.is_a?(String) != false || raise("Passed value for field obj.description_plaintext is not the expected type, validation failed.")
      obj.channels&.is_a?(Array) != false || raise("Passed value for field obj.channels is not the expected type, validation failed.")
      obj.is_archived&.is_a?(Boolean) != false || raise("Passed value for field obj.is_archived is not the expected type, validation failed.")
      obj.ecom_seo_data.nil? || square.rb::CatalogEcomSeoData.validate_raw(obj: obj.ecom_seo_data)
      obj.food_and_beverage_details.nil? || square.rb::CatalogItemFoodAndBeverageDetails.validate_raw(obj: obj.food_and_beverage_details)
      obj.reporting_category.nil? || square.rb::CatalogObjectCategory.validate_raw(obj: obj.reporting_category)
      obj.is_alcoholic&.is_a?(Boolean) != false || raise("Passed value for field obj.is_alcoholic is not the expected type, validation failed.")
    end
  end
end