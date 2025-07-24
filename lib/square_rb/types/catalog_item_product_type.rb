# frozen_string_literal: true

module SquareApiClient
# The type of a CatalogItem. Connect V2 only allows the creation of `REGULAR` or
#  `APPOINTMENTS_SERVICE` items.
  class CatalogItemProductType

    REGULAR = "REGULAR"
    GIFT_CARD = "GIFT_CARD"
    APPOINTMENTS_SERVICE = "APPOINTMENTS_SERVICE"
    FOOD_AND_BEV = "FOOD_AND_BEV"
    EVENT = "EVENT"
    DIGITAL = "DIGITAL"
    DONATION = "DONATION"
    LEGACY_SQUARE_ONLINE_SERVICE = "LEGACY_SQUARE_ONLINE_SERVICE"
    LEGACY_SQUARE_ONLINE_MEMBERSHIP = "LEGACY_SQUARE_ONLINE_MEMBERSHIP"

  end
end