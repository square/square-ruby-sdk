# frozen_string_literal: true

module Square
  module Types
    class CardForgottenEventCard < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :customer_id, -> { String }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :reference_id, -> { String }, optional: true, nullable: false
      field :version, -> { Integer }, optional: true, nullable: false
      field :merchant_id, -> { String }, optional: true, nullable: false
    end
  end
end
