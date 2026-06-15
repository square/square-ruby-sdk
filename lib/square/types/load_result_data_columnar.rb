# frozen_string_literal: true

module Square
  module Types
    # Columnar data format - members list paired with one primitive array per column. Returned when
    # `responseFormat=columnar` is requested.
    class LoadResultDataColumnar < Internal::Types::Model
      field :members, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :columns, -> { Internal::Types::Array[Internal::Types::Array[Object]] }, optional: false, nullable: false
    end
  end
end
