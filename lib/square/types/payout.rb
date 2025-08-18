# frozen_string_literal: true

module Square
  module Types
    # An accounting of the amount owed the seller and record of the actual transfer to their
    # external bank account or to the Square balance.
    class Payout < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :status, -> { Square::Types::PayoutStatus }, optional: true, nullable: false
      field :location_id, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :destination, -> { Square::Types::Destination }, optional: true, nullable: false
      field :version, -> { Integer }, optional: true, nullable: false
      field :type, -> { Square::Types::PayoutType }, optional: true, nullable: false
      field :payout_fee, -> { Internal::Types::Array[Square::Types::PayoutFee] }, optional: true, nullable: false
      field :arrival_date, -> { String }, optional: true, nullable: false
      field :end_to_end_id, -> { String }, optional: true, nullable: false

    end
  end
end
