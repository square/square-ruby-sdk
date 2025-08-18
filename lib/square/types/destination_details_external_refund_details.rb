# frozen_string_literal: true

module Square
  module Types
    # Stores details about an external refund. Contains only non-confidential information.
    class DestinationDetailsExternalRefundDetails < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :source, -> { String }, optional: false, nullable: false
      field :source_id, -> { String }, optional: true, nullable: false

    end
  end
end
