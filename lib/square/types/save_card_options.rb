# frozen_string_literal: true

module Square
    module Types
        # Describes save-card action fields.
        class SaveCardOptions < Internal::Types::Model
            field :customer_id, String, optional: false, nullable: false
            field :card_id, String, optional: true, nullable: false
            field :reference_id, String, optional: true, nullable: false
        end
    end
end
