# frozen_string_literal: true
require_relative "catalog_pricing_type"
require_relative "money"
require_relative "item_variation_location_overrides"
require_relative "inventory_alert_type"
require_relative "catalog_item_option_value_for_item_variation"
require_relative "catalog_stock_conversion"
require "ostruct"
require "json"

module square.rb
# An item variation, representing a product for sale, in the Catalog object model.
#  Each [item](entity:CatalogItem) must have at least one
#  item variation and can have at most 250 item variations.
#  An item variation can be sellable, stockable, or both if it has a unit of
#  measure for its count for the sold number of the variation, the stocked
#  number of the variation, or both. For example, when a variation representing
#  wine is stocked and sold by the bottle, the variation is both
#  stockable and sellable. But when a variation of the wine is sold by the glass,
#  the sold units cannot be used as a measure of the stocked units. This
#  by-the-glass
#  variation is sellable, but not stockable. To accurately keep track of the wine's
#  inventory count at any time, the sellable count must be
#  converted to stockable count. Typically, the seller defines this unit
#  conversion. For example, 1 bottle equals 5 glasses. The Square API exposes
#  the `stockable_conversion` property on the variation to specify the conversion.
#  Thus, when two glasses of the wine are sold, the sellable count
#  decreases by 2, and the stockable count automatically decreases by 0.4 bottle
#  according to the conversion.
  class CatalogItemVariation
  # @return [String] The ID of the `CatalogItem` associated with this item variation.
    attr_reader :item_id
  # @return [String] The item variation's name. This is a searchable attribute for use in applicable
#  query filters.
#  Its value has a maximum length of 255 Unicode code points. However, when the
#  parent [item](entity:CatalogItem)
#  uses [item options](entity:CatalogItemOption), this attribute is auto-generated,
#  read-only, and can be
#  longer than 255 Unicode code points.
    attr_reader :name
  # @return [String] The item variation's SKU, if any. This is a searchable attribute for use in
#  applicable query filters.
    attr_reader :sku
  # @return [String] The universal product code (UPC) of the item variation, if any. This is a
#  searchable attribute for use in applicable query filters.
#  The value of this attribute should be a number of 12-14 digits long.  This
#  restriction is enforced on the Square Seller Dashboard,
#  Square Point of Sale or Retail Point of Sale apps, where this attribute shows in
#  the GTIN field. If a non-compliant UPC value is assigned
#  to this attribute using the API, the value is not editable on the Seller
#  Dashboard, Square Point of Sale or Retail Point of Sale apps
#  unless it is updated to fit the expected format.
    attr_reader :upc
  # @return [Integer] The order in which this item variation should be displayed. This value is
#  read-only. On writes, the ordinal
#  for each item variation within a parent `CatalogItem` is set according to the
#  item variations's
#  position. On reads, the value is not guaranteed to be sequential or unique.
    attr_reader :ordinal
  # @return [square.rb::CatalogPricingType] Indicates whether the item variation's price is fixed or determined at the time
#  of sale.
#  See [CatalogPricingType](#type-catalogpricingtype) for possible values
    attr_reader :pricing_type
  # @return [square.rb::Money] The item variation's price, if fixed pricing is used.
    attr_reader :price_money
  # @return [Array<square.rb::ItemVariationLocationOverrides>] Per-location price and inventory overrides.
    attr_reader :location_overrides
  # @return [Boolean] If `true`, inventory tracking is active for the variation.
    attr_reader :track_inventory
  # @return [square.rb::InventoryAlertType] Indicates whether the item variation displays an alert when its inventory
#  quantity is less than or equal
#  to its `inventory_alert_threshold`.
#  See [InventoryAlertType](#type-inventoryalerttype) for possible values
    attr_reader :inventory_alert_type
  # @return [Long] If the inventory quantity for the variation is less than or equal to this value
#  and `inventory_alert_type`
#  is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.
#  This value is always an integer.
    attr_reader :inventory_alert_threshold
  # @return [String] Arbitrary user metadata to associate with the item variation. This attribute
#  value length is of Unicode code points.
    attr_reader :user_data
  # @return [Long] If the `CatalogItem` that owns this item variation is of type
#  `APPOINTMENTS_SERVICE`, then this is the duration of the service in
#  milliseconds. For
#  example, a 30 minute appointment would have the value `1800000`, which is equal
#  to
#  30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second).
    attr_reader :service_duration
  # @return [Boolean] If the `CatalogItem` that owns this item variation is of type
#  `APPOINTMENTS_SERVICE`, a bool representing whether this service is available
#  for booking.
    attr_reader :available_for_booking
  # @return [Array<square.rb::CatalogItemOptionValueForItemVariation>] List of item option values associated with this item variation. Listed
#  in the same order as the item options of the parent item.
    attr_reader :item_option_values
  # @return [String] ID of the ‘CatalogMeasurementUnit’ that is used to measure the quantity
#  sold of this item variation. If left unset, the item will be sold in
#  whole quantities.
    attr_reader :measurement_unit_id
  # @return [Boolean] Whether this variation can be sold. The inventory count of a sellable variation
#  indicates
#  the number of units available for sale. When a variation is both stockable and
#  sellable,
#  its sellable inventory count can be smaller than or equal to its stockable
#  count.
    attr_reader :sellable
  # @return [Boolean] Whether stock is counted directly on this variation (TRUE) or only on its
#  components (FALSE).
#  When a variation is both stockable and sellable, the inventory count of a
#  stockable variation keeps track of the number of units of this variation in
#  stock
#  and is not an indicator of the number of units of the variation that can be
#  sold.
    attr_reader :stockable
  # @return [Array<String>] The IDs of images associated with this `CatalogItemVariation` instance.
#  These images will be shown to customers in Square Online Store.
    attr_reader :image_ids
  # @return [Array<String>] Tokens of employees that can perform the service represented by this variation.
#  Only valid for
#  variations of type `APPOINTMENTS_SERVICE`.
    attr_reader :team_member_ids
  # @return [square.rb::CatalogStockConversion] The unit conversion rule, as prescribed by the
#  [CatalogStockConversion](entity:CatalogStockConversion) type,
#  that describes how this non-stockable (i.e., sellable/receivable) item variation
#  is converted
#  to/from the stockable item variation sharing the same parent item. With the
#  stock conversion,
#  you can accurately track inventory when an item variation is sold in one unit,
#  but stocked in
#  another unit.
    attr_reader :stockable_conversion
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param item_id [String] The ID of the `CatalogItem` associated with this item variation.
    # @param name [String] The item variation's name. This is a searchable attribute for use in applicable
#  query filters.
#  Its value has a maximum length of 255 Unicode code points. However, when the
#  parent [item](entity:CatalogItem)
#  uses [item options](entity:CatalogItemOption), this attribute is auto-generated,
#  read-only, and can be
#  longer than 255 Unicode code points.
    # @param sku [String] The item variation's SKU, if any. This is a searchable attribute for use in
#  applicable query filters.
    # @param upc [String] The universal product code (UPC) of the item variation, if any. This is a
#  searchable attribute for use in applicable query filters.
#  The value of this attribute should be a number of 12-14 digits long.  This
#  restriction is enforced on the Square Seller Dashboard,
#  Square Point of Sale or Retail Point of Sale apps, where this attribute shows in
#  the GTIN field. If a non-compliant UPC value is assigned
#  to this attribute using the API, the value is not editable on the Seller
#  Dashboard, Square Point of Sale or Retail Point of Sale apps
#  unless it is updated to fit the expected format.
    # @param ordinal [Integer] The order in which this item variation should be displayed. This value is
#  read-only. On writes, the ordinal
#  for each item variation within a parent `CatalogItem` is set according to the
#  item variations's
#  position. On reads, the value is not guaranteed to be sequential or unique.
    # @param pricing_type [square.rb::CatalogPricingType] Indicates whether the item variation's price is fixed or determined at the time
#  of sale.
#  See [CatalogPricingType](#type-catalogpricingtype) for possible values
    # @param price_money [square.rb::Money] The item variation's price, if fixed pricing is used.
    # @param location_overrides [Array<square.rb::ItemVariationLocationOverrides>] Per-location price and inventory overrides.
    # @param track_inventory [Boolean] If `true`, inventory tracking is active for the variation.
    # @param inventory_alert_type [square.rb::InventoryAlertType] Indicates whether the item variation displays an alert when its inventory
#  quantity is less than or equal
#  to its `inventory_alert_threshold`.
#  See [InventoryAlertType](#type-inventoryalerttype) for possible values
    # @param inventory_alert_threshold [Long] If the inventory quantity for the variation is less than or equal to this value
#  and `inventory_alert_type`
#  is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.
#  This value is always an integer.
    # @param user_data [String] Arbitrary user metadata to associate with the item variation. This attribute
#  value length is of Unicode code points.
    # @param service_duration [Long] If the `CatalogItem` that owns this item variation is of type
#  `APPOINTMENTS_SERVICE`, then this is the duration of the service in
#  milliseconds. For
#  example, a 30 minute appointment would have the value `1800000`, which is equal
#  to
#  30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second).
    # @param available_for_booking [Boolean] If the `CatalogItem` that owns this item variation is of type
#  `APPOINTMENTS_SERVICE`, a bool representing whether this service is available
#  for booking.
    # @param item_option_values [Array<square.rb::CatalogItemOptionValueForItemVariation>] List of item option values associated with this item variation. Listed
#  in the same order as the item options of the parent item.
    # @param measurement_unit_id [String] ID of the ‘CatalogMeasurementUnit’ that is used to measure the quantity
#  sold of this item variation. If left unset, the item will be sold in
#  whole quantities.
    # @param sellable [Boolean] Whether this variation can be sold. The inventory count of a sellable variation
#  indicates
#  the number of units available for sale. When a variation is both stockable and
#  sellable,
#  its sellable inventory count can be smaller than or equal to its stockable
#  count.
    # @param stockable [Boolean] Whether stock is counted directly on this variation (TRUE) or only on its
#  components (FALSE).
#  When a variation is both stockable and sellable, the inventory count of a
#  stockable variation keeps track of the number of units of this variation in
#  stock
#  and is not an indicator of the number of units of the variation that can be
#  sold.
    # @param image_ids [Array<String>] The IDs of images associated with this `CatalogItemVariation` instance.
#  These images will be shown to customers in Square Online Store.
    # @param team_member_ids [Array<String>] Tokens of employees that can perform the service represented by this variation.
#  Only valid for
#  variations of type `APPOINTMENTS_SERVICE`.
    # @param stockable_conversion [square.rb::CatalogStockConversion] The unit conversion rule, as prescribed by the
#  [CatalogStockConversion](entity:CatalogStockConversion) type,
#  that describes how this non-stockable (i.e., sellable/receivable) item variation
#  is converted
#  to/from the stockable item variation sharing the same parent item. With the
#  stock conversion,
#  you can accurately track inventory when an item variation is sold in one unit,
#  but stocked in
#  another unit.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogItemVariation]
    def initialize(item_id: OMIT, name: OMIT, sku: OMIT, upc: OMIT, ordinal: OMIT, pricing_type: OMIT, price_money: OMIT, location_overrides: OMIT, track_inventory: OMIT, inventory_alert_type: OMIT, inventory_alert_threshold: OMIT, user_data: OMIT, service_duration: OMIT, available_for_booking: OMIT, item_option_values: OMIT, measurement_unit_id: OMIT, sellable: OMIT, stockable: OMIT, image_ids: OMIT, team_member_ids: OMIT, stockable_conversion: OMIT, additional_properties: nil)
      @item_id = item_id if item_id != OMIT
      @name = name if name != OMIT
      @sku = sku if sku != OMIT
      @upc = upc if upc != OMIT
      @ordinal = ordinal if ordinal != OMIT
      @pricing_type = pricing_type if pricing_type != OMIT
      @price_money = price_money if price_money != OMIT
      @location_overrides = location_overrides if location_overrides != OMIT
      @track_inventory = track_inventory if track_inventory != OMIT
      @inventory_alert_type = inventory_alert_type if inventory_alert_type != OMIT
      @inventory_alert_threshold = inventory_alert_threshold if inventory_alert_threshold != OMIT
      @user_data = user_data if user_data != OMIT
      @service_duration = service_duration if service_duration != OMIT
      @available_for_booking = available_for_booking if available_for_booking != OMIT
      @item_option_values = item_option_values if item_option_values != OMIT
      @measurement_unit_id = measurement_unit_id if measurement_unit_id != OMIT
      @sellable = sellable if sellable != OMIT
      @stockable = stockable if stockable != OMIT
      @image_ids = image_ids if image_ids != OMIT
      @team_member_ids = team_member_ids if team_member_ids != OMIT
      @stockable_conversion = stockable_conversion if stockable_conversion != OMIT
      @additional_properties = additional_properties
      @_field_set = { "item_id": item_id, "name": name, "sku": sku, "upc": upc, "ordinal": ordinal, "pricing_type": pricing_type, "price_money": price_money, "location_overrides": location_overrides, "track_inventory": track_inventory, "inventory_alert_type": inventory_alert_type, "inventory_alert_threshold": inventory_alert_threshold, "user_data": user_data, "service_duration": service_duration, "available_for_booking": available_for_booking, "item_option_values": item_option_values, "measurement_unit_id": measurement_unit_id, "sellable": sellable, "stockable": stockable, "image_ids": image_ids, "team_member_ids": team_member_ids, "stockable_conversion": stockable_conversion }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogItemVariation
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogItemVariation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      item_id = parsed_json["item_id"]
      name = parsed_json["name"]
      sku = parsed_json["sku"]
      upc = parsed_json["upc"]
      ordinal = parsed_json["ordinal"]
      pricing_type = parsed_json["pricing_type"]
      unless parsed_json["price_money"].nil?
        price_money = parsed_json["price_money"].to_json
        price_money = square.rb::Money.from_json(json_object: price_money)
      else
        price_money = nil
      end
      location_overrides = parsed_json["location_overrides"]&.map do | item |
  item = item.to_json
  square.rb::ItemVariationLocationOverrides.from_json(json_object: item)
end
      track_inventory = parsed_json["track_inventory"]
      inventory_alert_type = parsed_json["inventory_alert_type"]
      inventory_alert_threshold = parsed_json["inventory_alert_threshold"]
      user_data = parsed_json["user_data"]
      service_duration = parsed_json["service_duration"]
      available_for_booking = parsed_json["available_for_booking"]
      item_option_values = parsed_json["item_option_values"]&.map do | item |
  item = item.to_json
  square.rb::CatalogItemOptionValueForItemVariation.from_json(json_object: item)
end
      measurement_unit_id = parsed_json["measurement_unit_id"]
      sellable = parsed_json["sellable"]
      stockable = parsed_json["stockable"]
      image_ids = parsed_json["image_ids"]
      team_member_ids = parsed_json["team_member_ids"]
      unless parsed_json["stockable_conversion"].nil?
        stockable_conversion = parsed_json["stockable_conversion"].to_json
        stockable_conversion = square.rb::CatalogStockConversion.from_json(json_object: stockable_conversion)
      else
        stockable_conversion = nil
      end
      new(
        item_id: item_id,
        name: name,
        sku: sku,
        upc: upc,
        ordinal: ordinal,
        pricing_type: pricing_type,
        price_money: price_money,
        location_overrides: location_overrides,
        track_inventory: track_inventory,
        inventory_alert_type: inventory_alert_type,
        inventory_alert_threshold: inventory_alert_threshold,
        user_data: user_data,
        service_duration: service_duration,
        available_for_booking: available_for_booking,
        item_option_values: item_option_values,
        measurement_unit_id: measurement_unit_id,
        sellable: sellable,
        stockable: stockable,
        image_ids: image_ids,
        team_member_ids: team_member_ids,
        stockable_conversion: stockable_conversion,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogItemVariation to a JSON object
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
      obj.item_id&.is_a?(String) != false || raise("Passed value for field obj.item_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.sku&.is_a?(String) != false || raise("Passed value for field obj.sku is not the expected type, validation failed.")
      obj.upc&.is_a?(String) != false || raise("Passed value for field obj.upc is not the expected type, validation failed.")
      obj.ordinal&.is_a?(Integer) != false || raise("Passed value for field obj.ordinal is not the expected type, validation failed.")
      obj.pricing_type&.is_a?(square.rb::CatalogPricingType) != false || raise("Passed value for field obj.pricing_type is not the expected type, validation failed.")
      obj.price_money.nil? || square.rb::Money.validate_raw(obj: obj.price_money)
      obj.location_overrides&.is_a?(Array) != false || raise("Passed value for field obj.location_overrides is not the expected type, validation failed.")
      obj.track_inventory&.is_a?(Boolean) != false || raise("Passed value for field obj.track_inventory is not the expected type, validation failed.")
      obj.inventory_alert_type&.is_a?(square.rb::InventoryAlertType) != false || raise("Passed value for field obj.inventory_alert_type is not the expected type, validation failed.")
      obj.inventory_alert_threshold&.is_a?(Long) != false || raise("Passed value for field obj.inventory_alert_threshold is not the expected type, validation failed.")
      obj.user_data&.is_a?(String) != false || raise("Passed value for field obj.user_data is not the expected type, validation failed.")
      obj.service_duration&.is_a?(Long) != false || raise("Passed value for field obj.service_duration is not the expected type, validation failed.")
      obj.available_for_booking&.is_a?(Boolean) != false || raise("Passed value for field obj.available_for_booking is not the expected type, validation failed.")
      obj.item_option_values&.is_a?(Array) != false || raise("Passed value for field obj.item_option_values is not the expected type, validation failed.")
      obj.measurement_unit_id&.is_a?(String) != false || raise("Passed value for field obj.measurement_unit_id is not the expected type, validation failed.")
      obj.sellable&.is_a?(Boolean) != false || raise("Passed value for field obj.sellable is not the expected type, validation failed.")
      obj.stockable&.is_a?(Boolean) != false || raise("Passed value for field obj.stockable is not the expected type, validation failed.")
      obj.image_ids&.is_a?(Array) != false || raise("Passed value for field obj.image_ids is not the expected type, validation failed.")
      obj.team_member_ids&.is_a?(Array) != false || raise("Passed value for field obj.team_member_ids is not the expected type, validation failed.")
      obj.stockable_conversion.nil? || square.rb::CatalogStockConversion.validate_raw(obj: obj.stockable_conversion)
    end
  end
end