
module Square
  class VisibilityFilter
    includes Square::Internal::Types::Enum
    ALL = "ALL"
    READ = "READ"
    READ_WRITE = "READ_WRITE"
  end
end
