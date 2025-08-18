# frozen_string_literal: true

module Square
  module Types
    class SelectOptions < Internal::Types::Model
      field :title, String, optional: false, nullable: false
      field :body, String, optional: false, nullable: false
      field :options, Internal::Types::Array[Square::Types::SelectOption], optional: false, nullable: false
      field :selected_option, Square::Types::SelectOption, optional: true, nullable: false

    end
  end
end
