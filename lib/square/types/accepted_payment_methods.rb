# frozen_string_literal: true

module Square
  module Types
    class AcceptedPaymentMethods < Internal::Types::Model
      field :apple_pay, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :google_pay, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :cash_app_pay, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :afterpay_clearpay, -> { Internal::Types::Boolean }, optional: true, nullable: false

    end
  end
end
