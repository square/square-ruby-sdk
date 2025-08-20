# frozen_string_literal: true

module Square
  module Types
    class CheckoutLocationSettingsPolicy < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :title, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
