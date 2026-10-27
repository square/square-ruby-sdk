# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class JobUpdatedEventObject < Internal::Types::Model
      field :job, -> { Square::Types::Job }, optional: true, nullable: false
    end
  end
end
