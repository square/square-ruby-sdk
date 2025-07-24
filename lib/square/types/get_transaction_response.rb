# frozen_string_literal: true
require_relative "error"
require_relative "transaction"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the
#  [RetrieveTransaction](api-endpoint:Transactions-RetrieveTransaction) endpoint.
#  One of `errors` or `transaction` is present in a given response (never both).
  class GetTransactionResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::Transaction] The requested transaction.
    attr_reader :transaction
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param transaction [square.rb::Transaction] The requested transaction.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetTransactionResponse]
    def initialize(errors: OMIT, transaction: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @transaction = transaction if transaction != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "transaction": transaction }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetTransactionResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetTransactionResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["transaction"].nil?
        transaction = parsed_json["transaction"].to_json
        transaction = square.rb::Transaction.from_json(json_object: transaction)
      else
        transaction = nil
      end
      new(
        errors: errors,
        transaction: transaction,
        additional_properties: struct
      )
    end
# Serialize an instance of GetTransactionResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.transaction.nil? || square.rb::Transaction.validate_raw(obj: obj.transaction)
    end
  end
end