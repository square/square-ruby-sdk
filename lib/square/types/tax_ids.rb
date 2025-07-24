# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Identifiers for the location used by various governments for tax purposes.
  class TaxIds
  # @return [String] The EU VAT number for this location. For example, `IE3426675K`.
#  If the EU VAT number is present, it is well-formed and has been
#  validated with VIES, the VAT Information Exchange System.
    attr_reader :eu_vat
  # @return [String] The SIRET (Système d'Identification du Répertoire des Entreprises et de leurs
#  Etablissements)
#  number is a 14-digit code issued by the French INSEE. For example,
#  `39922799000021`.
    attr_reader :fr_siret
  # @return [String] The French government uses the NAF (Nomenclature des Activités Françaises) to
#  display and
#  track economic statistical data. This is also called the APE (Activite
#  Principale de l’Entreprise) code.
#  For example, `6910Z`.
    attr_reader :fr_naf
  # @return [String] The NIF (Numero de Identificacion Fiscal) number is a nine-character tax
#  identifier used in Spain.
#  If it is present, it has been validated. For example, `73628495A`.
    attr_reader :es_nif
  # @return [String] The QII (Qualified Invoice Issuer) number is a 14-character tax identifier used
#  in Japan.
#  For example, `T1234567890123`.
    attr_reader :jp_qii
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param eu_vat [String] The EU VAT number for this location. For example, `IE3426675K`.
#  If the EU VAT number is present, it is well-formed and has been
#  validated with VIES, the VAT Information Exchange System.
    # @param fr_siret [String] The SIRET (Système d'Identification du Répertoire des Entreprises et de leurs
#  Etablissements)
#  number is a 14-digit code issued by the French INSEE. For example,
#  `39922799000021`.
    # @param fr_naf [String] The French government uses the NAF (Nomenclature des Activités Françaises) to
#  display and
#  track economic statistical data. This is also called the APE (Activite
#  Principale de l’Entreprise) code.
#  For example, `6910Z`.
    # @param es_nif [String] The NIF (Numero de Identificacion Fiscal) number is a nine-character tax
#  identifier used in Spain.
#  If it is present, it has been validated. For example, `73628495A`.
    # @param jp_qii [String] The QII (Qualified Invoice Issuer) number is a 14-character tax identifier used
#  in Japan.
#  For example, `T1234567890123`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TaxIds]
    def initialize(eu_vat: OMIT, fr_siret: OMIT, fr_naf: OMIT, es_nif: OMIT, jp_qii: OMIT, additional_properties: nil)
      @eu_vat = eu_vat if eu_vat != OMIT
      @fr_siret = fr_siret if fr_siret != OMIT
      @fr_naf = fr_naf if fr_naf != OMIT
      @es_nif = es_nif if es_nif != OMIT
      @jp_qii = jp_qii if jp_qii != OMIT
      @additional_properties = additional_properties
      @_field_set = { "eu_vat": eu_vat, "fr_siret": fr_siret, "fr_naf": fr_naf, "es_nif": es_nif, "jp_qii": jp_qii }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TaxIds
    #
    # @param json_object [String] 
    # @return [square.rb::TaxIds]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      eu_vat = parsed_json["eu_vat"]
      fr_siret = parsed_json["fr_siret"]
      fr_naf = parsed_json["fr_naf"]
      es_nif = parsed_json["es_nif"]
      jp_qii = parsed_json["jp_qii"]
      new(
        eu_vat: eu_vat,
        fr_siret: fr_siret,
        fr_naf: fr_naf,
        es_nif: es_nif,
        jp_qii: jp_qii,
        additional_properties: struct
      )
    end
# Serialize an instance of TaxIds to a JSON object
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
      obj.eu_vat&.is_a?(String) != false || raise("Passed value for field obj.eu_vat is not the expected type, validation failed.")
      obj.fr_siret&.is_a?(String) != false || raise("Passed value for field obj.fr_siret is not the expected type, validation failed.")
      obj.fr_naf&.is_a?(String) != false || raise("Passed value for field obj.fr_naf is not the expected type, validation failed.")
      obj.es_nif&.is_a?(String) != false || raise("Passed value for field obj.es_nif is not the expected type, validation failed.")
      obj.jp_qii&.is_a?(String) != false || raise("Passed value for field obj.jp_qii is not the expected type, validation failed.")
    end
  end
end