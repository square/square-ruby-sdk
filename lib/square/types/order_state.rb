
module Square
    module Types
        class OrderState < Square::Internal::Types::Enum
            OPEN = "OPEN"
            COMPLETED = "COMPLETED"
            CANCELED = "CANCELED"
            DRAFT = "DRAFT"
        end
    end
end
