
module Square
    module Types
        class TenderCardDetailsStatus < Square::Internal::Types::Enum
            AUTHORIZED = "AUTHORIZED"
            CAPTURED = "CAPTURED"
            VOIDED = "VOIDED"
            FAILED = "FAILED"
        end
    end
end
