# frozen_string_literal: true

module Square
  module Types
    # Represents a promotion for a [loyalty program](entity:LoyaltyProgram). Loyalty promotions enable buyers
    # to earn extra points on top of those earned from the base program.
    # 
    # A loyalty program can have a maximum of 10 loyalty promotions with an `ACTIVE` or `SCHEDULED` status.
    class LoyaltyPromotion < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :name, String, optional: false, nullable: false
      field :incentive, Square::Types::LoyaltyPromotionIncentive, optional: false, nullable: false
      field :available_time, Square::Types::LoyaltyPromotionAvailableTimeData, optional: false, nullable: false
      field :trigger_limit, Square::Types::LoyaltyPromotionTriggerLimit, optional: true, nullable: false
      field :status, Square::Types::LoyaltyPromotionStatus, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false
      field :canceled_at, String, optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false
      field :loyalty_program_id, String, optional: true, nullable: false
      field :minimum_spend_amount_money, Square::Types::Money, optional: true, nullable: false
      field :qualifying_item_variation_ids, Internal::Types::Array[String], optional: true, nullable: false
      field :qualifying_category_ids, Internal::Types::Array[String], optional: true, nullable: false

    end
  end
end
