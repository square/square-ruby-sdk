# frozen_string_literal: true

module Square
  module Types
    class PaymentOptions < Internal::Types::Model
      field :autocomplete, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :delay_duration, -> { String }, optional: true, nullable: false
      field :accept_partial_authorization, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :delay_action, -> { Square::Types::PaymentOptionsDelayAction }, optional: true, nullable: false
    end
  end
end
