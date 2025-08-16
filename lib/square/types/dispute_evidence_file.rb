# frozen_string_literal: true

module Square
  module Types
    # A file to be uploaded as dispute evidence.
    class DisputeEvidenceFile < Internal::Types::Model
      field :filename, String, optional: true, nullable: false
      field :filetype, String, optional: true, nullable: false

    end
  end
end
