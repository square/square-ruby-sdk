# frozen_string_literal: true

module Square
    module Types
        # Fields to describe the action that displays QR-Codes.
        class QrCodeOptions < Internal::Types::Model
            field :title, String, optional: false, nullable: false
            field :body, String, optional: false, nullable: false
            field :barcode_contents, String, optional: false, nullable: false
        end
    end
end
