# frozen_string_literal: true

module Square
  module Types
    # Represents a phase, which can override subscription phases as defined by plan_id
    class Phase < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :ordinal, -> { Integer }, optional: true, nullable: false
      field :order_template_id, -> { String }, optional: true, nullable: false
      field :plan_phase_uid, -> { String }, optional: true, nullable: false
    end
  end
end
