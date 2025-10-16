# frozen_string_literal: true

module Square
  module Types
    class ListChannelsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :channels, -> { Internal::Types::Array[Square::Types::Channel] }, optional: true, nullable: false
      field :cursor, -> { String }, optional: true, nullable: false
    end
  end
end
