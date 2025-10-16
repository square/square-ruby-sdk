# frozen_string_literal: true

module Square
  module Channels
    module Types
      class ListChannelsRequest < Internal::Types::Model
        field :reference_type, -> { Square::Types::ReferenceType }, optional: true, nullable: false
        field :reference_id, -> { String }, optional: true, nullable: false
        field :status, -> { Square::Types::ChannelStatus }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
