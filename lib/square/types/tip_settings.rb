# frozen_string_literal: true

module Square
    module Types
        class TipSettings < Square::Internal::Types::Model
            field :allow_tipping, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :separate_tip_screen, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :custom_tip_field, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :tip_percentages, Square::Internal::Types::Array[Integer], optional: true, nullable: false
            field :smart_tipping, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
