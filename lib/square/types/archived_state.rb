# frozen_string_literal: true

module square.rb
# Defines the values for the `archived_state` query expression
#  used in [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems)
#  to return the archived, not archived or either type of catalog items.
  class ArchivedState

    ARCHIVED_STATE_NOT_ARCHIVED = "ARCHIVED_STATE_NOT_ARCHIVED"
    ARCHIVED_STATE_ARCHIVED = "ARCHIVED_STATE_ARCHIVED"
    ARCHIVED_STATE_ALL = "ARCHIVED_STATE_ALL"

  end
end