# frozen_string_literal: true

module Square
  module Types
    module CacheMode
      extend Square::Internal::Types::Enum

      STALE_IF_SLOW = "stale-if-slow"
      STALE_WHILE_REVALIDATE = "stale-while-revalidate"
      MUST_REVALIDATE = "must-revalidate"
      NO_CACHE = "no-cache"
    end
  end
end
