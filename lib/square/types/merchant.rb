# frozen_string_literal: true

module Square
  # Represents a business that sells with Square.
  class Merchant < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :business_name, String, optional: true, nullable: false
    field :country, Square::Country, optional: false, nullable: false
    field :language_code, String, optional: true, nullable: false
    field :currency, Square::Currency, optional: true, nullable: false
    field :status, Square::MerchantStatus, optional: true, nullable: false
    field :main_location_id, String, optional: true, nullable: false
    field :created_at, String, optional: true, nullable: false

  end
end
