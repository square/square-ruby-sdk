
module Square
  module Cards
    module Types
      class CreateCardRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :source_id, -> { String }, optional: false, nullable: false
        field :verification_token, -> { String }, optional: true, nullable: false
        field :card, -> { Square::Types::Card }, optional: false, nullable: false

      end
    end
  end
end
