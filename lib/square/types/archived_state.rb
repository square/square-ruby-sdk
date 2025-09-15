# frozen_string_literal: true

module Square
  module Types
    module ArchivedState
      extend Square::Internal::Types::Enum

      ARCHIVED_STATE_NOT_ARCHIVED = "ARCHIVED_STATE_NOT_ARCHIVED"
      ARCHIVED_STATE_ARCHIVED = "ARCHIVED_STATE_ARCHIVED"
      ARCHIVED_STATE_ALL = "ARCHIVED_STATE_ALL"
    end
  end
end
