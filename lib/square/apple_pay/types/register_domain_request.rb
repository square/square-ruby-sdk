# frozen_string_literal: true

module Square
  module ApplePay
    module Types
      class RegisterDomainRequest < Internal::Types::Model
        field :domain_name, -> { String }, optional: false, nullable: false
      end
    end
  end
end
