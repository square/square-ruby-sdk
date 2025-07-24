# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Describes receipt action fields.
  class ReceiptOptions
  # @return [String] The reference to the Square payment ID for the receipt.
    attr_reader :payment_id
  # @return [Boolean] Instructs the device to print the receipt without displaying the receipt
#  selection screen.
#  Requires `printer_enabled` set to true.
#  Defaults to false.
    attr_reader :print_only
  # @return [Boolean] Identify the receipt as a reprint rather than an original receipt.
#  Defaults to false.
    attr_reader :is_duplicate
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payment_id [String] The reference to the Square payment ID for the receipt.
    # @param print_only [Boolean] Instructs the device to print the receipt without displaying the receipt
#  selection screen.
#  Requires `printer_enabled` set to true.
#  Defaults to false.
    # @param is_duplicate [Boolean] Identify the receipt as a reprint rather than an original receipt.
#  Defaults to false.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ReceiptOptions]
    def initialize(payment_id:, print_only: OMIT, is_duplicate: OMIT, additional_properties: nil)
      @payment_id = payment_id
      @print_only = print_only if print_only != OMIT
      @is_duplicate = is_duplicate if is_duplicate != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payment_id": payment_id, "print_only": print_only, "is_duplicate": is_duplicate }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReceiptOptions
    #
    # @param json_object [String] 
    # @return [square.rb::ReceiptOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      payment_id = parsed_json["payment_id"]
      print_only = parsed_json["print_only"]
      is_duplicate = parsed_json["is_duplicate"]
      new(
        payment_id: payment_id,
        print_only: print_only,
        is_duplicate: is_duplicate,
        additional_properties: struct
      )
    end
# Serialize an instance of ReceiptOptions to a JSON object
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
      obj.payment_id.is_a?(String) != false || raise("Passed value for field obj.payment_id is not the expected type, validation failed.")
      obj.print_only&.is_a?(Boolean) != false || raise("Passed value for field obj.print_only is not the expected type, validation failed.")
      obj.is_duplicate&.is_a?(Boolean) != false || raise("Passed value for field obj.is_duplicate is not the expected type, validation failed.")
    end
  end
end