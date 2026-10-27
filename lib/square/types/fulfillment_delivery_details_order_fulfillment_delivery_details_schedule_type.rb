# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module FulfillmentDeliveryDetailsOrderFulfillmentDeliveryDetailsScheduleType
      extend Square::Internal::Types::Enum

      SCHEDULED = "SCHEDULED"
      ASAP = "ASAP"
    end
  end
end
