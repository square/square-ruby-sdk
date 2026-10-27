# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Describes a loyalty account in a [loyalty program](entity:LoyaltyProgram). For more information, see
    # [Create and Retrieve Loyalty Accounts](https://developer.squareup.com/docs/loyalty-api/loyalty-accounts).
    class LoyaltyAccount < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :program_id, -> { String }, optional: false, nullable: false

      field :balance, -> { Integer }, optional: true, nullable: false

      field :lifetime_points, -> { Integer }, optional: true, nullable: false

      field :customer_id, -> { String }, optional: true, nullable: true

      field :enrolled_at, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :mapping, -> { Square::Types::LoyaltyAccountMapping }, optional: true, nullable: false

      field :expiring_point_deadlines, -> { Internal::Types::Array[Square::Types::LoyaltyAccountExpiringPointDeadline] }, optional: true, nullable: true
    end
  end
end
