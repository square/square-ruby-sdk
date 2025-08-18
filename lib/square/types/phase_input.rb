# frozen_string_literal: true

module Square
  module Types
    # Represents the arguments used to construct a new phase.
    class PhaseInput < Internal::Types::Model
      field :ordinal, -> { Integer }, optional: false, nullable: false
      field :order_template_id, -> { String }, optional: true, nullable: false

    end
  end
end
