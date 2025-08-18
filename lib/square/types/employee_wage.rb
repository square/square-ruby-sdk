# frozen_string_literal: true

module Square
  module Types
    # The hourly wage rate that an employee earns on a `Shift` for doing the job specified by the `title` property of this object. Deprecated at version 2020-08-26. Use [TeamMemberWage](entity:TeamMemberWage).
    class EmployeeWage < Internal::Types::Model
      field :id, String, optional: true, nullable: false
      field :employee_id, String, optional: true, nullable: false
      field :title, String, optional: true, nullable: false
      field :hourly_rate, Square::Types::Money, optional: true, nullable: false

    end
  end
end
