# frozen_string_literal: true

module Square
  module Channels
    module Types
      class ListChannelsRequest < Internal::Types::Model
        field :reference_type, -> { Square::Types::ReferenceType }, optional: true, nullable: true

        field :reference_id, -> { String }, optional: true, nullable: true

        field :status, -> { Square::Types::ChannelStatus }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true
      end
    end
  end
end
