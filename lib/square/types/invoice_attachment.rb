# frozen_string_literal: true

module Square
  module Types
    # Represents a file attached to an [invoice](entity:Invoice).
    class InvoiceAttachment < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :filename, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :filesize, -> { Integer }, optional: true, nullable: false
      field :hash_, -> { String }, optional: true, nullable: false
      field :mime_type, -> { String }, optional: true, nullable: false
      field :uploaded_at, -> { String }, optional: true, nullable: false
    end
  end
end
