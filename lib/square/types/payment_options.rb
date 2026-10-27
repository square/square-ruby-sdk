# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class PaymentOptions < Internal::Types::Model
      field :autocomplete, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :delay_duration, -> { String }, optional: true, nullable: true

      field :accept_partial_authorization, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :delay_action, -> { Square::Types::PaymentOptionsDelayAction }, optional: true, nullable: false
    end
  end
end
