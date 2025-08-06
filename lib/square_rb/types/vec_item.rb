# frozen_string_literal: true

require_relative "collection_configuration"
require_relative "hash_map"
require "ostruct"
require "json"

module ChromaApiClient
  class VecItem
    # @return [ChromaApiClient::CollectionConfiguration]
    attr_reader :configuration_json
    # @return [String]
    attr_reader :database
    # @return [Integer]
    attr_reader :dimension
    # @return [String]
    attr_reader :id
    # @return [Long]
    attr_reader :log_position
    # @return [ChromaApiClient::HASH_MAP]
    attr_reader :metadata
    # @return [String]
    attr_reader :name
    # @return [String]
    attr_reader :tenant
    # @return [Integer]
    attr_reader :version
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param configuration_json [ChromaApiClient::CollectionConfiguration]
    # @param database [String]
    # @param dimension [Integer]
    # @param id [String]
    # @param log_position [Long]
    # @param metadata [ChromaApiClient::HASH_MAP]
    # @param name [String]
    # @param tenant [String]
    # @param version [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChromaApiClient::VecItem]
    def initialize(configuration_json:, database:, id:, log_position:, name:, tenant:, version:, dimension: OMIT,
                   metadata: OMIT, additional_properties: nil)
      @configuration_json = configuration_json
      @database = database
      @dimension = dimension if dimension != OMIT
      @id = id
      @log_position = log_position
      @metadata = metadata if metadata != OMIT
      @name = name
      @tenant = tenant
      @version = version
      @additional_properties = additional_properties
      @_field_set = {
        "configuration_json": configuration_json,
        "database": database,
        "dimension": dimension,
        "id": id,
        "log_position": log_position,
        "metadata": metadata,
        "name": name,
        "tenant": tenant,
        "version": version
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of VecItem
    #
    # @param json_object [String]
    # @return [ChromaApiClient::VecItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["configuration_json"].nil?
        configuration_json = nil
      else
        configuration_json = parsed_json["configuration_json"].to_json
        configuration_json = ChromaApiClient::CollectionConfiguration.from_json(json_object: configuration_json)
      end
      database = parsed_json["database"]
      dimension = parsed_json["dimension"]
      id = parsed_json["id"]
      log_position = parsed_json["log_position"]
      metadata = parsed_json["metadata"]&.transform_values do |value|
        value = value.to_json
        ChromaApiClient::HashMapValue.from_json(json_object: value)
      end
      name = parsed_json["name"]
      tenant = parsed_json["tenant"]
      version = parsed_json["version"]
      new(
        configuration_json: configuration_json,
        database: database,
        dimension: dimension,
        id: id,
        log_position: log_position,
        metadata: metadata,
        name: name,
        tenant: tenant,
        version: version,
        additional_properties: struct
      )
    end

    # Serialize an instance of VecItem to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      ChromaApiClient::CollectionConfiguration.validate_raw(obj: obj.configuration_json)
      obj.database.is_a?(String) != false || raise("Passed value for field obj.database is not the expected type, validation failed.")
      obj.dimension&.is_a?(Integer) != false || raise("Passed value for field obj.dimension is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.log_position.is_a?(Long) != false || raise("Passed value for field obj.log_position is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.tenant.is_a?(String) != false || raise("Passed value for field obj.tenant is not the expected type, validation failed.")
      obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
    end
  end
end
