# frozen_string_literal: true

module Square
  module Types
    class PayoutPaidEventData < Internal::Types::Model
      field :type, String, optional: true, nullable: false
      field :id, String, optional: true, nullable: false
      field :object, Square::Types::PayoutPaidEventObject, optional: true, nullable: false

    end
  end
end
