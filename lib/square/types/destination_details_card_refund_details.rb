# frozen_string_literal: true

module Square
  module Types
    class DestinationDetailsCardRefundDetails < Internal::Types::Model
      field :card, Square::Card, optional: true, nullable: false
      field :entry_method, String, optional: true, nullable: false
      field :auth_result_code, String, optional: true, nullable: false

    end
  end
end
