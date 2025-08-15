# frozen_string_literal: true

module Square
  # A type-specific filter used in a [custom attribute filter](entity:CustomerCustomAttributeFilter) to search based on the value 
  # of a customer-related [custom attribute](entity:CustomAttribute).
  class CustomerCustomAttributeFilterValue < Internal::Types::Model
    field :email, Square::CustomerTextFilter, optional: true, nullable: false
    field :phone, Square::CustomerTextFilter, optional: true, nullable: false
    field :text, Square::CustomerTextFilter, optional: true, nullable: false
    field :selection, Square::FilterValue, optional: true, nullable: false
    field :date, Square::TimeRange, optional: true, nullable: false
    field :number, Square::FloatNumberRange, optional: true, nullable: false
    field :boolean, Internal::Types::Boolean, optional: true, nullable: false
    field :address, Square::CustomerAddressFilter, optional: true, nullable: false

  end
end
