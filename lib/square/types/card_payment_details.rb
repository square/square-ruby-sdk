# frozen_string_literal: true

module Square
  module Types
    # Reflects the current status of a card payment. Contains only non-confidential information.
    class CardPaymentDetails < Internal::Types::Model
      field :status, -> { String }, optional: true, nullable: false
      field :card, -> { Square::Types::Card }, optional: true, nullable: false
      field :entry_method, -> { String }, optional: true, nullable: false
      field :cvv_status, -> { String }, optional: true, nullable: false
      field :avs_status, -> { String }, optional: true, nullable: false
      field :auth_result_code, -> { String }, optional: true, nullable: false
      field :application_identifier, -> { String }, optional: true, nullable: false
      field :application_name, -> { String }, optional: true, nullable: false
      field :application_cryptogram, -> { String }, optional: true, nullable: false
      field :verification_method, -> { String }, optional: true, nullable: false
      field :verification_results, -> { String }, optional: true, nullable: false
      field :statement_description, -> { String }, optional: true, nullable: false
      field :device_details, -> { Square::Types::DeviceDetails }, optional: true, nullable: false
      field :card_payment_timeline, -> { Square::Types::CardPaymentTimeline }, optional: true, nullable: false
      field :refund_requires_card_presence, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
