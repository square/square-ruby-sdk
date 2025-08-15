# frozen_string_literal: true

module Square
  # The customer address filter. This filter is used in a [CustomerCustomAttributeFilterValue](entity:CustomerCustomAttributeFilterValue) filter when
  # searching by an `Address`-type custom attribute.
  class CustomerAddressFilter < Internal::Types::Model
    field :postal_code, Square::CustomerTextFilter, optional: true, nullable: false
    field :country, Square::Country, optional: true, nullable: false

  end
end
