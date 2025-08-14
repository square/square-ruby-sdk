
module Square
    module Types
        class InvoiceRequestMethod
            extends Square::Internal::Types::Enum
            EMAIL = "EMAIL"
            CHARGE_CARD_ON_FILE = "CHARGE_CARD_ON_FILE"
            SHARE_MANUALLY = "SHARE_MANUALLY"
            CHARGE_BANK_ON_FILE = "CHARGE_BANK_ON_FILE"
            SMS = "SMS"
            SMS_CHARGE_CARD_ON_FILE = "SMS_CHARGE_CARD_ON_FILE"
            SMS_CHARGE_BANK_ON_FILE = "SMS_CHARGE_BANK_ON_FILE"
        end
    end
end
