# frozen_string_literal: true

module Square
  module Types
    # Represents the filtering criteria in a [search query](entity:CustomerQuery) that defines how to filter
    # customer profiles returned in [SearchCustomers](api-endpoint:Customers-SearchCustomers) results.
    class CustomerFilter < Internal::Types::Model
      field :creation_source, Square::Types::CustomerCreationSourceFilter, optional: true, nullable: false
      field :created_at, Square::Types::TimeRange, optional: true, nullable: false
      field :updated_at, Square::Types::TimeRange, optional: true, nullable: false
      field :email_address, Square::Types::CustomerTextFilter, optional: true, nullable: false
      field :phone_number, Square::Types::CustomerTextFilter, optional: true, nullable: false
      field :reference_id, Square::Types::CustomerTextFilter, optional: true, nullable: false
      field :group_ids, Square::Types::FilterValue, optional: true, nullable: false
      field :custom_attribute, Square::Types::CustomerCustomAttributeFilters, optional: true, nullable: false
      field :segment_ids, Square::Types::FilterValue, optional: true, nullable: false

    end
  end
end
