# frozen_string_literal: true

module Square
  class BankAccountDisabledEventData < Internal::Types::Model
    field :type, String, optional: true, nullable: false
    field :id, String, optional: true, nullable: false
    field :object, Square::BankAccountDisabledEventObject, optional: true, nullable: false

  end
end
