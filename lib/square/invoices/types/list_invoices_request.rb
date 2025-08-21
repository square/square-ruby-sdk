# frozen_string_literal: true

module Square
  module Invoices
    module Types
      class ListInvoicesRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: false, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
