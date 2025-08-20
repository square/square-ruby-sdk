# frozen_string_literal: true

module Square
  module Types
    # A filter to select resources based on an exact field value. For any given
    # value, the value can only be in one property. Depending on the field, either
    # all properties can be set or only a subset will be available.
    #
    # Refer to the documentation of the field.
    class FilterValue < Internal::Types::Model
      field :all, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :any, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :none, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
