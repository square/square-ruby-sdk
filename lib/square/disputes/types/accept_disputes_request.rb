# frozen_string_literal: true

module Square
  module Disputes
    module Types
      class AcceptDisputesRequest < Internal::Types::Model
        field :dispute_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
