# frozen_string_literal: true

module Square
  # The data associated with the event.
  class CustomerDeletedEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::CustomerDeletedEventObject, optional: true, nullable: false

  end
end
