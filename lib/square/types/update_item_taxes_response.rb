# frozen_string_literal: true

module Square
  module Types
    class UpdateItemTaxesResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :updated_at, String, optional: true, nullable: false

    end
  end
end
