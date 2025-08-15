# frozen_string_literal: true

module Square
  class PayoutPaidEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::PayoutPaidEventObject, optional: true, nullable: false

  end
end
