# frozen_string_literal: true

module Square
  # Represents the snippet that is added to a Square Online site. The snippet code is injected into the `head` element of all pages on the site, except for checkout pages.
  class Snippet < Internal::Types::Model
    field :id, String, optional: true, nullable: false
    field :site_id, String, optional: true, nullable: false
    field :content, String, optional: false, nullable: false
    field :created_at, String, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false

  end
end
