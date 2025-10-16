# frozen_string_literal: true

module Square
  module Channels
    module Types
      class BulkRetrieveChannelsRequest < Internal::Types::Model
        field :channel_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
