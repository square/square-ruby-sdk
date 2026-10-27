# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class RetrieveChannelResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

      field :channel, -> { Square::Types::Channel }, optional: true, nullable: false
    end
  end
end
