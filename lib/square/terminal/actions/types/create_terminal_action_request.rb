
module Square
  module Terminal
    module Actions
      module Types
        class CreateTerminalActionRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false
          field :action, -> { Square::Types::TerminalAction }, optional: false, nullable: false

        end
      end
    end
  end
end
