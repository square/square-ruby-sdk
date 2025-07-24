# frozen_string_literal: true
require_relative "customer_creation_source_filter"
require_relative "time_range"
require_relative "customer_text_filter"
require_relative "filter_value"
require_relative "customer_custom_attribute_filters"
require "ostruct"
require "json"

module square.rb
# Represents the filtering criteria in a [search query](entity:CustomerQuery) that
#  defines how to filter
#  customer profiles returned in
#  [SearchCustomers](api-endpoint:Customers-SearchCustomers) results.
  class CustomerFilter
  # @return [square.rb::CustomerCreationSourceFilter] A filter to select customers based on their creation source.
    attr_reader :creation_source
  # @return [square.rb::TimeRange] A filter to select customers based on when they were created.
    attr_reader :created_at
  # @return [square.rb::TimeRange] A filter to select customers based on when they were last updated.
    attr_reader :updated_at
  # @return [square.rb::CustomerTextFilter] A filter to [select customers by their email
#  eup.com/docs/customers-api/use-the-api/search-customers#search-by-email-address)
#  visible to the seller.
#  This filter is case-insensitive.
#  For [exact
#  /docs/customers-api/use-the-api/search-customers#exact-search-by-email-address),
#  this
#  filter causes the search to return customer profiles
#  whose `email_address` field value are identical to the email address provided
#  in the query.
#  For [fuzzy
#  /docs/customers-api/use-the-api/search-customers#fuzzy-search-by-email-address),
#  this filter causes the search to return customer profiles
#  whose `email_address` field value has a token-wise partial match against the
#  filtering
#  expression in the query. For example, with `Steven gmail` provided in a search
#  query, the search returns customers whose email address is
#  `steven.johnson@gmail.com`
#  or `mygmail@stevensbakery.com`. Square removes any punctuation (including
#  periods (.),
#  underscores (_), and the @ symbol) and tokenizes the email addresses on spaces.
#  A match is
#  found if a tokenized email address contains all the tokens in the search query,
#  irrespective of the token order.
    attr_reader :email_address
  # @return [square.rb::CustomerTextFilter] A filter to [select customers by their phone
#  reup.com/docs/customers-api/use-the-api/search-customers#search-by-phone-number)
#  visible to the seller.
#  For [exact
#  m/docs/customers-api/use-the-api/search-customers#exact-search-by-phone-number),
#  this filter returns customers whose phone number matches the specified query
#  expression. The number in the query must be of an
#  E.164-compliant form. In particular, it must include the leading `+` sign
#  followed by a country code and then a subscriber number.
#  For example, the standard E.164 form of a US phone number is `+12062223333` and
#  an E.164-compliant variation is `+1 (206) 222-3333`.
#  To match the query expression, stored customer phone numbers are converted to
#  the standard E.164 form.
#  For [fuzzy
#  m/docs/customers-api/use-the-api/search-customers#fuzzy-search-by-phone-number),
#  this filter returns customers whose phone number matches the token or tokens
#  provided in the query expression. For example, with `415`
#  provided in a search query, the search returns customers with the phone numbers
#  `+1-415-212-1200`, `+1-212-415-1234`, and `+1 (551) 234-1567`.
#  Similarly, a search query of `415 123` returns customers with the phone numbers
#  `+1-212-415-1234` and `+1 (551) 234-1567` but not
#  `+1-212-415-1200`. A match is found if a tokenized phone number contains all the
#  tokens in the search query, irrespective of the token order.
    attr_reader :phone_number
  # @return [square.rb::CustomerTextFilter] A filter to [select customers by their reference
#  eup.com/docs/customers-api/use-the-api/search-customers#search-by-reference-id).
#  This filter is case-insensitive.
#  [Exact
#  om/docs/customers-api/use-the-api/search-customers#exact-search-by-reference-id)
#  of a customer's reference ID against a query's reference ID is evaluated as an
#  exact match between two strings, character by character in the given order.
#  [Fuzzy
#  om/docs/customers-api/use-the-api/search-customers#fuzzy-search-by-reference-id)
#  of stored reference IDs against queried reference IDs works
#  exactly the same as fuzzy matching on email addresses. Non-alphanumeric
#  characters
#  are replaced by spaces to tokenize stored and queried reference IDs. A match is
#  found
#  if a tokenized stored reference ID contains all tokens specified in any order in
#  the query. For example,
#  a query of `NYC M` matches customer profiles with the `reference_id` value of
#  `NYC_M_35_JOHNSON`
#  and `NYC_27_MURRAY`.
    attr_reader :reference_id
  # @return [square.rb::FilterValue] A filter to select customers based on the [groups](entity:CustomerGroup) they
#  belong to.
#  Group membership is controlled by sellers and developers.
#  The `group_ids` filter has the following syntax:
#  ```
#  "group_ids": {
#  "any":  ["{group_a_id}", "{group_b_id}", ...],
#  "all":  ["{group_1_id}", "{group_2_id}", ...],
#  "none": ["{group_i_id}", "{group_ii_id}", ...]
#  }
#  ```
#  You can use any combination of the `any`, `all`, and `none` fields in the
#  filter.
#  With `any`, the search returns customers in groups `a` or `b` or any other group
#  specified in the list.
#  With `all`, the search returns customers in groups `1` and `2` and all other
#  groups specified in the list.
#  With `none`, the search returns customers not in groups `i` or `ii` or any other
#  group specified in the list.
#  If any of the search conditions are not met, including when an invalid or
#  non-existent group ID is provided,
#  the result is an empty object (`{}`).
    attr_reader :group_ids
  # @return [square.rb::CustomerCustomAttributeFilters] A filter to select customers based on one or more custom attributes.
#  This filter can contain up to 10 custom attribute filters. Each custom attribute
#  filter specifies filtering criteria for a target custom
#  attribute. If multiple custom attribute filters are provided, they are combined
#  as an `AND` operation.
#  To be valid for a search, the custom attributes must be visible to the
#  requesting application. For more information, including example queries,
#  see [Search by custom
#  com/docs/customers-api/use-the-api/search-customers#search-by-custom-attribute).
#  Square returns matching customer profiles, which do not contain custom
#  attributes. To retrieve customer-related custom attributes,
#  use the [Customer Custom Attributes API](api:CustomerCustomAttributes). For
#  example, you can call
#  ttribute](api-endpoint:CustomerCustomAttributes-RetrieveCustomerCustomAttribute)
#  using a customer ID from the result set.
    attr_reader :custom_attribute
  # @return [square.rb::FilterValue] A filter to select customers based on the [segments](entity:CustomerSegment)
#  they belong to.
#  Segment membership is dynamic and adjusts automatically based on whether
#  customers meet the segment criteria.
#  You can provide up to three segment IDs in the filter, using any combination of
#  the `all`, `any`, and `none` fields.
#  For the following example, the results include customers who belong to both
#  segment A and segment B but do not belong to segment C.
#  ```
#  "segment_ids": {
#  "all":  ["{segment_A_id}", "{segment_B_id}"],
#  "none":  ["{segment_C_id}"]
#  }
#  ```
#  If an invalid or non-existent segment ID is provided in the filter, Square stops
#  processing the request
#  and returns a `400 BAD_REQUEST` error that includes the segment ID.
    attr_reader :segment_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param creation_source [square.rb::CustomerCreationSourceFilter] A filter to select customers based on their creation source.
    # @param created_at [square.rb::TimeRange] A filter to select customers based on when they were created.
    # @param updated_at [square.rb::TimeRange] A filter to select customers based on when they were last updated.
    # @param email_address [square.rb::CustomerTextFilter] A filter to [select customers by their email
#  eup.com/docs/customers-api/use-the-api/search-customers#search-by-email-address)
#  visible to the seller.
#  This filter is case-insensitive.
#  For [exact
#  /docs/customers-api/use-the-api/search-customers#exact-search-by-email-address),
#  this
#  filter causes the search to return customer profiles
#  whose `email_address` field value are identical to the email address provided
#  in the query.
#  For [fuzzy
#  /docs/customers-api/use-the-api/search-customers#fuzzy-search-by-email-address),
#  this filter causes the search to return customer profiles
#  whose `email_address` field value has a token-wise partial match against the
#  filtering
#  expression in the query. For example, with `Steven gmail` provided in a search
#  query, the search returns customers whose email address is
#  `steven.johnson@gmail.com`
#  or `mygmail@stevensbakery.com`. Square removes any punctuation (including
#  periods (.),
#  underscores (_), and the @ symbol) and tokenizes the email addresses on spaces.
#  A match is
#  found if a tokenized email address contains all the tokens in the search query,
#  irrespective of the token order.
    # @param phone_number [square.rb::CustomerTextFilter] A filter to [select customers by their phone
#  reup.com/docs/customers-api/use-the-api/search-customers#search-by-phone-number)
#  visible to the seller.
#  For [exact
#  m/docs/customers-api/use-the-api/search-customers#exact-search-by-phone-number),
#  this filter returns customers whose phone number matches the specified query
#  expression. The number in the query must be of an
#  E.164-compliant form. In particular, it must include the leading `+` sign
#  followed by a country code and then a subscriber number.
#  For example, the standard E.164 form of a US phone number is `+12062223333` and
#  an E.164-compliant variation is `+1 (206) 222-3333`.
#  To match the query expression, stored customer phone numbers are converted to
#  the standard E.164 form.
#  For [fuzzy
#  m/docs/customers-api/use-the-api/search-customers#fuzzy-search-by-phone-number),
#  this filter returns customers whose phone number matches the token or tokens
#  provided in the query expression. For example, with `415`
#  provided in a search query, the search returns customers with the phone numbers
#  `+1-415-212-1200`, `+1-212-415-1234`, and `+1 (551) 234-1567`.
#  Similarly, a search query of `415 123` returns customers with the phone numbers
#  `+1-212-415-1234` and `+1 (551) 234-1567` but not
#  `+1-212-415-1200`. A match is found if a tokenized phone number contains all the
#  tokens in the search query, irrespective of the token order.
    # @param reference_id [square.rb::CustomerTextFilter] A filter to [select customers by their reference
#  eup.com/docs/customers-api/use-the-api/search-customers#search-by-reference-id).
#  This filter is case-insensitive.
#  [Exact
#  om/docs/customers-api/use-the-api/search-customers#exact-search-by-reference-id)
#  of a customer's reference ID against a query's reference ID is evaluated as an
#  exact match between two strings, character by character in the given order.
#  [Fuzzy
#  om/docs/customers-api/use-the-api/search-customers#fuzzy-search-by-reference-id)
#  of stored reference IDs against queried reference IDs works
#  exactly the same as fuzzy matching on email addresses. Non-alphanumeric
#  characters
#  are replaced by spaces to tokenize stored and queried reference IDs. A match is
#  found
#  if a tokenized stored reference ID contains all tokens specified in any order in
#  the query. For example,
#  a query of `NYC M` matches customer profiles with the `reference_id` value of
#  `NYC_M_35_JOHNSON`
#  and `NYC_27_MURRAY`.
    # @param group_ids [square.rb::FilterValue] A filter to select customers based on the [groups](entity:CustomerGroup) they
#  belong to.
#  Group membership is controlled by sellers and developers.
#  The `group_ids` filter has the following syntax:
#  ```
#  "group_ids": {
#  "any":  ["{group_a_id}", "{group_b_id}", ...],
#  "all":  ["{group_1_id}", "{group_2_id}", ...],
#  "none": ["{group_i_id}", "{group_ii_id}", ...]
#  }
#  ```
#  You can use any combination of the `any`, `all`, and `none` fields in the
#  filter.
#  With `any`, the search returns customers in groups `a` or `b` or any other group
#  specified in the list.
#  With `all`, the search returns customers in groups `1` and `2` and all other
#  groups specified in the list.
#  With `none`, the search returns customers not in groups `i` or `ii` or any other
#  group specified in the list.
#  If any of the search conditions are not met, including when an invalid or
#  non-existent group ID is provided,
#  the result is an empty object (`{}`).
    # @param custom_attribute [square.rb::CustomerCustomAttributeFilters] A filter to select customers based on one or more custom attributes.
#  This filter can contain up to 10 custom attribute filters. Each custom attribute
#  filter specifies filtering criteria for a target custom
#  attribute. If multiple custom attribute filters are provided, they are combined
#  as an `AND` operation.
#  To be valid for a search, the custom attributes must be visible to the
#  requesting application. For more information, including example queries,
#  see [Search by custom
#  com/docs/customers-api/use-the-api/search-customers#search-by-custom-attribute).
#  Square returns matching customer profiles, which do not contain custom
#  attributes. To retrieve customer-related custom attributes,
#  use the [Customer Custom Attributes API](api:CustomerCustomAttributes). For
#  example, you can call
#  ttribute](api-endpoint:CustomerCustomAttributes-RetrieveCustomerCustomAttribute)
#  using a customer ID from the result set.
    # @param segment_ids [square.rb::FilterValue] A filter to select customers based on the [segments](entity:CustomerSegment)
#  they belong to.
#  Segment membership is dynamic and adjusts automatically based on whether
#  customers meet the segment criteria.
#  You can provide up to three segment IDs in the filter, using any combination of
#  the `all`, `any`, and `none` fields.
#  For the following example, the results include customers who belong to both
#  segment A and segment B but do not belong to segment C.
#  ```
#  "segment_ids": {
#  "all":  ["{segment_A_id}", "{segment_B_id}"],
#  "none":  ["{segment_C_id}"]
#  }
#  ```
#  If an invalid or non-existent segment ID is provided in the filter, Square stops
#  processing the request
#  and returns a `400 BAD_REQUEST` error that includes the segment ID.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerFilter]
    def initialize(creation_source: OMIT, created_at: OMIT, updated_at: OMIT, email_address: OMIT, phone_number: OMIT, reference_id: OMIT, group_ids: OMIT, custom_attribute: OMIT, segment_ids: OMIT, additional_properties: nil)
      @creation_source = creation_source if creation_source != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @email_address = email_address if email_address != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @reference_id = reference_id if reference_id != OMIT
      @group_ids = group_ids if group_ids != OMIT
      @custom_attribute = custom_attribute if custom_attribute != OMIT
      @segment_ids = segment_ids if segment_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "creation_source": creation_source, "created_at": created_at, "updated_at": updated_at, "email_address": email_address, "phone_number": phone_number, "reference_id": reference_id, "group_ids": group_ids, "custom_attribute": custom_attribute, "segment_ids": segment_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerFilter
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["creation_source"].nil?
        creation_source = parsed_json["creation_source"].to_json
        creation_source = square.rb::CustomerCreationSourceFilter.from_json(json_object: creation_source)
      else
        creation_source = nil
      end
      unless parsed_json["created_at"].nil?
        created_at = parsed_json["created_at"].to_json
        created_at = square.rb::TimeRange.from_json(json_object: created_at)
      else
        created_at = nil
      end
      unless parsed_json["updated_at"].nil?
        updated_at = parsed_json["updated_at"].to_json
        updated_at = square.rb::TimeRange.from_json(json_object: updated_at)
      else
        updated_at = nil
      end
      unless parsed_json["email_address"].nil?
        email_address = parsed_json["email_address"].to_json
        email_address = square.rb::CustomerTextFilter.from_json(json_object: email_address)
      else
        email_address = nil
      end
      unless parsed_json["phone_number"].nil?
        phone_number = parsed_json["phone_number"].to_json
        phone_number = square.rb::CustomerTextFilter.from_json(json_object: phone_number)
      else
        phone_number = nil
      end
      unless parsed_json["reference_id"].nil?
        reference_id = parsed_json["reference_id"].to_json
        reference_id = square.rb::CustomerTextFilter.from_json(json_object: reference_id)
      else
        reference_id = nil
      end
      unless parsed_json["group_ids"].nil?
        group_ids = parsed_json["group_ids"].to_json
        group_ids = square.rb::FilterValue.from_json(json_object: group_ids)
      else
        group_ids = nil
      end
      unless parsed_json["custom_attribute"].nil?
        custom_attribute = parsed_json["custom_attribute"].to_json
        custom_attribute = square.rb::CustomerCustomAttributeFilters.from_json(json_object: custom_attribute)
      else
        custom_attribute = nil
      end
      unless parsed_json["segment_ids"].nil?
        segment_ids = parsed_json["segment_ids"].to_json
        segment_ids = square.rb::FilterValue.from_json(json_object: segment_ids)
      else
        segment_ids = nil
      end
      new(
        creation_source: creation_source,
        created_at: created_at,
        updated_at: updated_at,
        email_address: email_address,
        phone_number: phone_number,
        reference_id: reference_id,
        group_ids: group_ids,
        custom_attribute: custom_attribute,
        segment_ids: segment_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerFilter to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.creation_source.nil? || square.rb::CustomerCreationSourceFilter.validate_raw(obj: obj.creation_source)
      obj.created_at.nil? || square.rb::TimeRange.validate_raw(obj: obj.created_at)
      obj.updated_at.nil? || square.rb::TimeRange.validate_raw(obj: obj.updated_at)
      obj.email_address.nil? || square.rb::CustomerTextFilter.validate_raw(obj: obj.email_address)
      obj.phone_number.nil? || square.rb::CustomerTextFilter.validate_raw(obj: obj.phone_number)
      obj.reference_id.nil? || square.rb::CustomerTextFilter.validate_raw(obj: obj.reference_id)
      obj.group_ids.nil? || square.rb::FilterValue.validate_raw(obj: obj.group_ids)
      obj.custom_attribute.nil? || square.rb::CustomerCustomAttributeFilters.validate_raw(obj: obj.custom_attribute)
      obj.segment_ids.nil? || square.rb::FilterValue.validate_raw(obj: obj.segment_ids)
    end
  end
end