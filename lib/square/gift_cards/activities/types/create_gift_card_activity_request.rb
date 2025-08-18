
module Square
  module GiftCards
    module Activities
      module Types
        class CreateGiftCardActivityRequest < Internal::Types::Model
          field :idempotency_key, String, optional: false, nullable: false
          field :gift_card_activity, Square::Types::GiftCardActivity, optional: false, nullable: false

        end
      end
    end
  end
end
