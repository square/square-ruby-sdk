# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CardForgottenEventCard < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :customer_id, -> { String }, optional: true, nullable: true

      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :reference_id, -> { String }, optional: true, nullable: true

      field :version, -> { Integer }, optional: true, nullable: false

      field :merchant_id, -> { String }, optional: true, nullable: true
    end
  end
end
