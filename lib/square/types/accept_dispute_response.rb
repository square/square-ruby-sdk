# frozen_string_literal: true

module Square
  module Types
    # Defines the fields in an `AcceptDispute` response.
    class AcceptDisputeResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :dispute, -> { Square::Types::Dispute }, optional: true, nullable: false
    end
  end
end
