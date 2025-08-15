
module Square
  class VisibilityFilter
    include Square::Internal::Types::Enum
    ALL = "ALL"
    READ = "READ"
    READ_WRITE = "READ_WRITE"
  end
end
