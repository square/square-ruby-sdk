# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a business that sells with Square.
    class Merchant < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :business_name, -> { String }, optional: true, nullable: true

      field :country, -> { Square::Types::Country }, optional: false, nullable: false

      field :language_code, -> { String }, optional: true, nullable: true

      field :currency, -> { Square::Types::Currency }, optional: true, nullable: false

      field :status, -> { Square::Types::MerchantStatus }, optional: true, nullable: false

      field :main_location_id, -> { String }, optional: true, nullable: true

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
