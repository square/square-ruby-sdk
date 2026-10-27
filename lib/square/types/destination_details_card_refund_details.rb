# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DestinationDetailsCardRefundDetails < Internal::Types::Model
      field :card, -> { Square::Types::Card }, optional: true, nullable: false

      field :entry_method, -> { String }, optional: true, nullable: true

      field :auth_result_code, -> { String }, optional: true, nullable: true
    end
  end
end
