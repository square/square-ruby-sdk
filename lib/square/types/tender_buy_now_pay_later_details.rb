# frozen_string_literal: true

module Square
  # Represents the details of a tender with `type` `BUY_NOW_PAY_LATER`.
  class TenderBuyNowPayLaterDetails < Internal::Types::Model
    field :buy_now_pay_later_brand, Square::TenderBuyNowPayLaterDetailsBrand, optional: true, nullable: false
    field :status, Square::TenderBuyNowPayLaterDetailsStatus, optional: true, nullable: false

  end
end
