
module Square
  module Payments
    module Types
      class CreatePaymentRequest < Internal::Types::Model
        field :source_id, String, optional: false, nullable: false
        field :idempotency_key, String, optional: false, nullable: false
        field :amount_money, Square::Types::Money, optional: true, nullable: false
        field :tip_money, Square::Types::Money, optional: true, nullable: false
        field :app_fee_money, Square::Types::Money, optional: true, nullable: false
        field :delay_duration, String, optional: true, nullable: false
        field :delay_action, String, optional: true, nullable: false
        field :autocomplete, Internal::Types::Boolean, optional: true, nullable: false
        field :order_id, String, optional: true, nullable: false
        field :customer_id, String, optional: true, nullable: false
        field :location_id, String, optional: true, nullable: false
        field :team_member_id, String, optional: true, nullable: false
        field :reference_id, String, optional: true, nullable: false
        field :verification_token, String, optional: true, nullable: false
        field :accept_partial_authorization, Internal::Types::Boolean, optional: true, nullable: false
        field :buyer_email_address, String, optional: true, nullable: false
        field :buyer_phone_number, String, optional: true, nullable: false
        field :billing_address, Square::Types::Address, optional: true, nullable: false
        field :shipping_address, Square::Types::Address, optional: true, nullable: false
        field :note, String, optional: true, nullable: false
        field :statement_description_identifier, String, optional: true, nullable: false
        field :cash_details, Square::Types::CashPaymentDetails, optional: true, nullable: false
        field :external_details, Square::Types::ExternalPaymentDetails, optional: true, nullable: false
        field :customer_details, Square::Types::CustomerDetails, optional: true, nullable: false
        field :offline_payment_details, Square::Types::OfflinePaymentDetails, optional: true, nullable: false

      end
    end
  end
end
