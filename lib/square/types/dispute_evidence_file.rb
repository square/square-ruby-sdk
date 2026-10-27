# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A file to be uploaded as dispute evidence.
    class DisputeEvidenceFile < Internal::Types::Model
      field :filename, -> { String }, optional: true, nullable: true

      field :filetype, -> { String }, optional: true, nullable: true
    end
  end
end
