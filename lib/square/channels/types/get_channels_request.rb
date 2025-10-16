# frozen_string_literal: true

module Square
  module Channels
    module Types
      class GetChannelsRequest < Internal::Types::Model
        field :channel_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
