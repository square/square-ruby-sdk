# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module ChannelStatus
      extend Square::Internal::Types::Enum

      ACTIVE = "ACTIVE"
      INACTIVE = "INACTIVE"
    end
  end
end
