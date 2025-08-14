# frozen_string_literal: true

module Square
  module Types
    # Details about a refund's destination.
    class DestinationDetails < Internal::Types::Model
      field :card_details, Square::DestinationDetailsCardRefundDetails, optional: true, nullable: false
      field :cash_details, Square::DestinationDetailsCashRefundDetails, optional: true, nullable: false
      field :external_details, Square::DestinationDetailsExternalRefundDetails, optional: true, nullable: false

    end
  end
end
