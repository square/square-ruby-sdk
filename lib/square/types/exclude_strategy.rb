# frozen_string_literal: true

module SquareApiClient
# Indicates which products matched by a CatalogPricingRule
#  will be excluded if the pricing rule uses an exclude set.
  class ExcludeStrategy

    LEAST_EXPENSIVE = "LEAST_EXPENSIVE"
    MOST_EXPENSIVE = "MOST_EXPENSIVE"

  end
end