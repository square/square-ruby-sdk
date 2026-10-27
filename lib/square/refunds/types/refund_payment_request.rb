# frozen_string_literal: true

module Square
  module Refunds
    module Types
      class RefundPaymentRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false

        field :amount_money, -> { Square::Types::Money }, optional: false, nullable: false

        field :app_fee_money, -> { Square::Types::Money }, optional: true, nullable: false

        field :app_fee_allocations, -> { Internal::Types::Array[Object] }, optional: true, nullable: true

        field :payment_id, -> { String }, optional: true, nullable: true

        field :destination_id, -> { String }, optional: true, nullable: true

        field :unlinked, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :location_id, -> { String }, optional: true, nullable: true

        field :customer_id, -> { String }, optional: true, nullable: true

        field :reason, -> { String }, optional: true, nullable: true

        field :payment_version_token, -> { String }, optional: true, nullable: true

        field :team_member_id, -> { String }, optional: true, nullable: true

        field :cash_details, -> { Square::Types::DestinationDetailsCashRefundDetails }, optional: true, nullable: false

        field :external_details, -> { Square::Types::DestinationDetailsExternalRefundDetails }, optional: true, nullable: false
      end
    end
  end
end
