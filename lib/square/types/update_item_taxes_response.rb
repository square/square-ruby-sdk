# frozen_string_literal: true

module Square
  class UpdateItemTaxesResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false

  end
end
