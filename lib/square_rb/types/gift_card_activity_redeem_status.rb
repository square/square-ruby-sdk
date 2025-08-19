# frozen_string_literal: true

module SquareApiClient
# Indicates the status of a [gift card](entity:GiftCard) redemption. This status
#  is relevant only for
#  redemptions made from Square products (such as Square Point of Sale) because
#  Square products use a
#  two-state process. Gift cards redeemed using the Gift Card Activities API always
#  have a `COMPLETED` status.
  class GiftCardActivityRedeemStatus

    PENDING = "PENDING"
    COMPLETED = "COMPLETED"
    CANCELED = "CANCELED"

  end
end