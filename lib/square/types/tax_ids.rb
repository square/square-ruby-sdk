# frozen_string_literal: true

module Square
  module Types
    # Identifiers for the location used by various governments for tax purposes.
    class TaxIds < Internal::Types::Model
      field :eu_vat, String, optional: true, nullable: false
      field :fr_siret, String, optional: true, nullable: false
      field :fr_naf, String, optional: true, nullable: false
      field :es_nif, String, optional: true, nullable: false
      field :jp_qii, String, optional: true, nullable: false

    end
  end
end
