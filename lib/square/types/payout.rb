# frozen_string_literal: true

module Square
    module Types
        # An accounting of the amount owed the seller and record of the actual transfer to their
        # external bank account or to the Square balance.
        class Payout < Square::Internal::Types::Model
            field :id, String, optional: false, nullable: false
            field :status, Square::PayoutStatus, optional: true, nullable: false
            field :location_id, String, optional: false, nullable: false
            field :created_at, String, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
            field :amount_money, Square::Money, optional: true, nullable: false
            field :destination, Square::Destination, optional: true, nullable: false
            field :version, Integer, optional: true, nullable: false
            field :type, Square::PayoutType, optional: true, nullable: false
            field :payout_fee, Square::Internal::Types::Array[Square::PayoutFee], optional: true, nullable: false
            field :arrival_date, String, optional: true, nullable: false
            field :end_to_end_id, String, optional: true, nullable: false
        end
    end
end
