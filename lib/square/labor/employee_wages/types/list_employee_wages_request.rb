
module Square
    module Labor
        module EmployeeWages
            class ListEmployeeWagesRequest
                field :employee_id, String, optional: true, nullable: false
                field :limit, Integer, optional: true, nullable: false
                field :cursor, String, optional: true, nullable: false
            end
        end
    end
end
