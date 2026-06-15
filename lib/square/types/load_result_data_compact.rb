# frozen_string_literal: true

module Square
  module Types
    # Compact data format - a single object with the members list and a dataset of primitive arrays. Returned when
    # `responseFormat=compact` is requested.
    class LoadResultDataCompact < Internal::Types::Model
      field :members, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :dataset, -> { Internal::Types::Array[Internal::Types::Array[Object]] }, optional: false, nullable: false
    end
  end
end
