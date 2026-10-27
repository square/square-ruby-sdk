# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Details about the application that took the payment.
    class ApplicationDetails < Internal::Types::Model
      field :square_product, -> { Square::Types::ApplicationDetailsExternalSquareProduct }, optional: true, nullable: false

      field :application_id, -> { String }, optional: true, nullable: true
    end
  end
end
