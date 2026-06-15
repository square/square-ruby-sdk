# frozen_string_literal: true

module Square
  module Types
    # Result `data` payload. Either an array of objects keyed by member name (default); a compact `{ members, dataset }`
    # object when `responseFormat=compact`; or a columnar `{ members, columns }` object when `responseFormat=columnar`.
    class LoadResultData < Internal::Types::Model
      extend Square::Internal::Types::Union

      member -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }
      member -> { Square::Types::LoadResultDataCompact }
      member -> { Square::Types::LoadResultDataColumnar }
    end
  end
end
