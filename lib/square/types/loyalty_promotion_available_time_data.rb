# frozen_string_literal: true

module Square
  module Types
    # Represents scheduling information that determines when purchases can qualify to earn points
    # from a [loyalty promotion](entity:LoyaltyPromotion).
    class LoyaltyPromotionAvailableTimeData < Internal::Types::Model
      field :start_date, String, optional: true, nullable: false
      field :end_date, String, optional: true, nullable: false
      field :time_periods, Internal::Types::Array[String], optional: false, nullable: false

    end
  end
end
