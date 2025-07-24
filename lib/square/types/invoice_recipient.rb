# frozen_string_literal: true
require_relative "address"
require_relative "invoice_recipient_tax_ids"
require "ostruct"
require "json"

module square.rb
# Represents a snapshot of customer data. This object stores customer data that is
#  displayed on the invoice
#  and that Square uses to deliver the invoice.
#  When you provide a customer ID for a draft invoice, Square retrieves the
#  associated customer profile and populates
#  the remaining `InvoiceRecipient` fields. You cannot update these fields after
#  the invoice is published.
#  Square updates the customer ID in response to a merge operation, but does not
#  update other fields.
  class InvoiceRecipient
  # @return [String] The ID of the customer. This is the customer profile ID that
#  you provide when creating a draft invoice.
    attr_reader :customer_id
  # @return [String] The recipient's given (that is, first) name.
    attr_reader :given_name
  # @return [String] The recipient's family (that is, last) name.
    attr_reader :family_name
  # @return [String] The recipient's email address.
    attr_reader :email_address
  # @return [square.rb::Address] The recipient's physical address.
    attr_reader :address
  # @return [String] The recipient's phone number.
    attr_reader :phone_number
  # @return [String] The name of the recipient's company.
    attr_reader :company_name
  # @return [square.rb::InvoiceRecipientTaxIds] The recipient's tax IDs. The country of the seller account determines whether
#  this field
#  is available for the customer. For more information, see [Invoice recipient tax
#  s](https://developer.squareup.com/docs/invoices-api/overview#recipient-tax-ids).
    attr_reader :tax_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param customer_id [String] The ID of the customer. This is the customer profile ID that
#  you provide when creating a draft invoice.
    # @param given_name [String] The recipient's given (that is, first) name.
    # @param family_name [String] The recipient's family (that is, last) name.
    # @param email_address [String] The recipient's email address.
    # @param address [square.rb::Address] The recipient's physical address.
    # @param phone_number [String] The recipient's phone number.
    # @param company_name [String] The name of the recipient's company.
    # @param tax_ids [square.rb::InvoiceRecipientTaxIds] The recipient's tax IDs. The country of the seller account determines whether
#  this field
#  is available for the customer. For more information, see [Invoice recipient tax
#  s](https://developer.squareup.com/docs/invoices-api/overview#recipient-tax-ids).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::InvoiceRecipient]
    def initialize(customer_id: OMIT, given_name: OMIT, family_name: OMIT, email_address: OMIT, address: OMIT, phone_number: OMIT, company_name: OMIT, tax_ids: OMIT, additional_properties: nil)
      @customer_id = customer_id if customer_id != OMIT
      @given_name = given_name if given_name != OMIT
      @family_name = family_name if family_name != OMIT
      @email_address = email_address if email_address != OMIT
      @address = address if address != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @company_name = company_name if company_name != OMIT
      @tax_ids = tax_ids if tax_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "customer_id": customer_id, "given_name": given_name, "family_name": family_name, "email_address": email_address, "address": address, "phone_number": phone_number, "company_name": company_name, "tax_ids": tax_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoiceRecipient
    #
    # @param json_object [String] 
    # @return [square.rb::InvoiceRecipient]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      customer_id = parsed_json["customer_id"]
      given_name = parsed_json["given_name"]
      family_name = parsed_json["family_name"]
      email_address = parsed_json["email_address"]
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = square.rb::Address.from_json(json_object: address)
      else
        address = nil
      end
      phone_number = parsed_json["phone_number"]
      company_name = parsed_json["company_name"]
      unless parsed_json["tax_ids"].nil?
        tax_ids = parsed_json["tax_ids"].to_json
        tax_ids = square.rb::InvoiceRecipientTaxIds.from_json(json_object: tax_ids)
      else
        tax_ids = nil
      end
      new(
        customer_id: customer_id,
        given_name: given_name,
        family_name: family_name,
        email_address: email_address,
        address: address,
        phone_number: phone_number,
        company_name: company_name,
        tax_ids: tax_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoiceRecipient to a JSON object
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
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.given_name&.is_a?(String) != false || raise("Passed value for field obj.given_name is not the expected type, validation failed.")
      obj.family_name&.is_a?(String) != false || raise("Passed value for field obj.family_name is not the expected type, validation failed.")
      obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
      obj.address.nil? || square.rb::Address.validate_raw(obj: obj.address)
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.company_name&.is_a?(String) != false || raise("Passed value for field obj.company_name is not the expected type, validation failed.")
      obj.tax_ids.nil? || square.rb::InvoiceRecipientTaxIds.validate_raw(obj: obj.tax_ids)
    end
  end
end