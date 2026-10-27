# frozen_string_literal: true

module Square
  module Invoices
    module Types
      class ListInvoicesRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: false, nullable: false

        field :cursor, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true
      end
    end
  end
end
