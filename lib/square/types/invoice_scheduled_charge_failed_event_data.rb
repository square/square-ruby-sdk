# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class InvoiceScheduledChargeFailedEventData < Internal::Types::Model
      field :type, -> { String }, optional: true, nullable: true

      field :id, -> { String }, optional: true, nullable: false

      field :object, -> { Square::Types::InvoiceScheduledChargeFailedEventObject }, optional: true, nullable: false
    end
  end
end
