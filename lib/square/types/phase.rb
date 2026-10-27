# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a phase, which can override subscription phases as defined by plan_id
    class Phase < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :ordinal, -> { Integer }, optional: true, nullable: true

      field :order_template_id, -> { String }, optional: true, nullable: true

      field :plan_phase_uid, -> { String }, optional: true, nullable: true
    end
  end
end
