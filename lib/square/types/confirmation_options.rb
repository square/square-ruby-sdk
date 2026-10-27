# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class ConfirmationOptions < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false

      field :body, -> { String }, optional: false, nullable: false

      field :agree_button_text, -> { String }, optional: false, nullable: false

      field :disagree_button_text, -> { String }, optional: true, nullable: true

      field :decision, -> { Square::Types::ConfirmationDecision }, optional: true, nullable: false
    end
  end
end
