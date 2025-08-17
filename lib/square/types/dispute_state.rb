# frozen_string_literal: true

module Square
  module Types
    module DisputeState
      extends Square::Internal::Types::Enum
      INQUIRY_EVIDENCE_REQUIRED = "INQUIRY_EVIDENCE_REQUIRED"
      INQUIRY_PROCESSING = "INQUIRY_PROCESSING"
      INQUIRY_CLOSED = "INQUIRY_CLOSED"
      EVIDENCE_REQUIRED = "EVIDENCE_REQUIRED"
      PROCESSING = "PROCESSING"
      WON = "WON"
      LOST = "LOST"
      ACCEPTED = "ACCEPTED"end
  end
end
