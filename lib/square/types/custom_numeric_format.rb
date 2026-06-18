# frozen_string_literal: true

module Square
  module Types
    # Custom numeric format for numeric measures and dimensions
    class CustomNumericFormat < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
    end
  end
end
