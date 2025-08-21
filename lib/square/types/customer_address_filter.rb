# frozen_string_literal: true

module Square
  module Types
    # The customer address filter. This filter is used in a [CustomerCustomAttributeFilterValue](entity:CustomerCustomAttributeFilterValue) filter when
    # searching by an `Address`-type custom attribute.
    class CustomerAddressFilter < Internal::Types::Model
      field :postal_code, -> { Square::Types::CustomerTextFilter }, optional: true, nullable: false
      field :country, -> { Square::Types::Country }, optional: true, nullable: false
    end
  end
end
