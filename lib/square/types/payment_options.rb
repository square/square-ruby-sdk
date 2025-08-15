# frozen_string_literal: true

module Square
  class PaymentOptions < Internal::Types::Model
    field :autocomplete, Internal::Types::Boolean, optional: true, nullable: false
    field :delay_duration, String, optional: true, nullable: false
    field :accept_partial_authorization, Internal::Types::Boolean, optional: true, nullable: false
    field :delay_action, Square::PaymentOptionsDelayAction, optional: true, nullable: false

  end
end
