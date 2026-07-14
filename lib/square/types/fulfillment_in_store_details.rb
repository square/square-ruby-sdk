# frozen_string_literal: true

module Square
  module Types
    # Contains the details necessary to fulfill an in-store order.
    class FulfillmentInStoreDetails < Internal::Types::Model
      field :note, -> { String }, optional: true, nullable: false
      field :recipient, -> { Square::Types::FulfillmentRecipient }, optional: true, nullable: false
      field :placed_at, -> { String }, optional: true, nullable: false
      field :completed_at, -> { String }, optional: true, nullable: false
      field :in_progress_at, -> { String }, optional: true, nullable: false
      field :prepared_at, -> { String }, optional: true, nullable: false
      field :canceled_at, -> { String }, optional: true, nullable: false
    end
  end
end
