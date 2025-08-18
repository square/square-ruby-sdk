# frozen_string_literal: true

module Square
  module Types
    # The creation source filter.
    # 
    # If one or more creation sources are set, customer profiles are included in,
    # or excluded from, the result if they match at least one of the filter criteria.
    class CustomerCreationSourceFilter < Internal::Types::Model
      field :values, -> { Internal::Types::Array[Square::Types::CustomerCreationSource] }, optional: true, nullable: false
      field :rule, -> { Square::Types::CustomerInclusionExclusion }, optional: true, nullable: false

    end
  end
end
