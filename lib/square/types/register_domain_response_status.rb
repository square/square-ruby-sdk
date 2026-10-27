# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module RegisterDomainResponseStatus
      extend Square::Internal::Types::Enum

      PENDING = "PENDING"
      VERIFIED = "VERIFIED"
    end
  end
end
