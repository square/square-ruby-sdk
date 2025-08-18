# frozen_string_literal: true

module Square
  module Types
    # Represents communication preferences for the customer profile.
    class CustomerPreferences < Internal::Types::Model
      field :email_unsubscribed, -> { Internal::Types::Boolean }, optional: true, nullable: false

    end
  end
end
