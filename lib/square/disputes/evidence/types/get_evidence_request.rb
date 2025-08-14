
module Square
  module Disputes
    module Evidence
      class GetEvidenceRequest < Internal::Types::Model
        field :dispute_id, String, optional: false, nullable: false
        field :evidence_id, String, optional: false, nullable: false

      end
    end
  end
end
