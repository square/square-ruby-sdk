# frozen_string_literal: true

module Square
  module Types
    # Defines the fields that are included in the request body for the
    # [BulkRetrieveChannels](api-endpoint:Channels-BulkRetrieveChannels) endpoint.
    class BulkRetrieveChannelsResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :responses, lambda {
        Internal::Types::Hash[String, Square::Types::RetrieveChannelResponse]
      }, optional: true, nullable: false
    end
  end
end
