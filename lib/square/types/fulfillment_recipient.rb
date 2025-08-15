# frozen_string_literal: true

module Square
  # Information about the fulfillment recipient.
  class FulfillmentRecipient < Internal::Types::Model
    field :customer_id, String, optional: true, nullable: false
    field :display_name, String, optional: true, nullable: false
    field :email_address, String, optional: true, nullable: false
    field :phone_number, String, optional: true, nullable: false
    field :address, Square::Address, optional: true, nullable: false

  end
end
