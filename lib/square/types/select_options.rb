# frozen_string_literal: true

module Square
  class SelectOptions < Internal::Types::Model
    field :title, String, optional: false, nullable: false
    field :body, String, optional: false, nullable: false
    field :options, Internal::Types::Array[Square::SelectOption], optional: false, nullable: false
    field :selected_option, Square::SelectOption, optional: true, nullable: false

  end
end
