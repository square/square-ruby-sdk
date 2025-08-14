
module Square
    module Types
        class TenderSquareAccountDetailsStatus
            extends Square::Internal::Types::Enum
            AUTHORIZED = "AUTHORIZED"
            CAPTURED = "CAPTURED"
            VOIDED = "VOIDED"
            FAILED = "FAILED"
        end
    end
end
