
module Square
    module Types
        class CheckoutOptionsPaymentType < Square::Internal::Types::Enum
            CARD_PRESENT = "CARD_PRESENT"
            MANUAL_CARD_ENTRY = "MANUAL_CARD_ENTRY"
            FELICA_ID = "FELICA_ID"
            FELICA_QUICPAY = "FELICA_QUICPAY"
            FELICA_TRANSPORTATION_GROUP = "FELICA_TRANSPORTATION_GROUP"
            FELICA_ALL = "FELICA_ALL"
            PAYPAY = "PAYPAY"
            QR_CODE = "QR_CODE"
        end
    end
end
