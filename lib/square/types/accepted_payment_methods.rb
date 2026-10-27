# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class AcceptedPaymentMethods < Internal::Types::Model
      field :apple_pay, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :google_pay, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :cash_app_pay, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :afterpay_clearpay, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
