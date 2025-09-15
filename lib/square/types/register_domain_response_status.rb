# frozen_string_literal: true

module Square
  module Types
    module RegisterDomainResponseStatus
      extend Square::Internal::Types::Enum

      PENDING = "PENDING"
      VERIFIED = "VERIFIED"
    end
  end
end
