# frozen_string_literal: true

module Square
  module Types
    # Link format with label and type
    class LinkFormat < Internal::Types::Model
      field :label, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
    end
  end
end
