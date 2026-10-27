# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A tip being returned.
    class OrderReturnTip < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :applied_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :source_tender_uid, -> { String }, optional: true, nullable: true

      field :source_tender_id, -> { String }, optional: true, nullable: true
    end
  end
end
