# frozen_string_literal: true

module Square
  module Types
    # A type-specific filter used in a [custom attribute filter](entity:CustomerCustomAttributeFilter) to search based on the value 
    # of a customer-related [custom attribute](entity:CustomAttribute).
    class CustomerCustomAttributeFilterValue < Internal::Types::Model
      field :email, Square::Types::CustomerTextFilter, optional: true, nullable: false
      field :phone, Square::Types::CustomerTextFilter, optional: true, nullable: false
      field :text, Square::Types::CustomerTextFilter, optional: true, nullable: false
      field :selection, Square::Types::FilterValue, optional: true, nullable: false
      field :date, Square::Types::TimeRange, optional: true, nullable: false
      field :number, Square::Types::FloatNumberRange, optional: true, nullable: false
      field :boolean, Internal::Types::Boolean, optional: true, nullable: false
      field :address, Square::Types::CustomerAddressFilter, optional: true, nullable: false

    end
  end
end
