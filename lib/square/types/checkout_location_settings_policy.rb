# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CheckoutLocationSettingsPolicy < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :title, -> { String }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true
    end
  end
end
