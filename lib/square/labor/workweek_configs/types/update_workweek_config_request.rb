
module Square
  module Labor
    module WorkweekConfigs
      module Types
        class UpdateWorkweekConfigRequest < Internal::Types::Model
          field :id, String, optional: false, nullable: false
          field :workweek_config, Square::Types::WorkweekConfig, optional: false, nullable: false

        end
      end
    end
  end
end
