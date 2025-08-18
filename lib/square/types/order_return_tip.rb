# frozen_string_literal: true

module Square
  module Types
    # A tip being returned.
    class OrderReturnTip < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :applied_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :source_tender_uid, -> { String }, optional: true, nullable: false
      field :source_tender_id, -> { String }, optional: true, nullable: false

    end
  end
end
