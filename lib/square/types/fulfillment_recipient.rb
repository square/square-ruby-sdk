# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Information about the fulfillment recipient.
    class FulfillmentRecipient < Internal::Types::Model
      field :customer_id, -> { String }, optional: true, nullable: true

      field :display_name, -> { String }, optional: true, nullable: true

      field :email_address, -> { String }, optional: true, nullable: true

      field :phone_number, -> { String }, optional: true, nullable: true

      field :address, -> { Square::Types::Address }, optional: true, nullable: false
    end
  end
end
