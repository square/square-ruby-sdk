
module Square
    module Types
        class TenderSquareAccountDetailsStatus < Square::Internal::Types::Enum
            AUTHORIZED = "AUTHORIZED"
            CAPTURED = "CAPTURED"
            VOIDED = "VOIDED"
            FAILED = "FAILED"
        end
    end
end
