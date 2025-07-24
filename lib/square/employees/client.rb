# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/employee_status"
require_relative "../types/list_employees_response"
require_relative "../types/get_employee_response"
require "async"
require "async"
require_relative "../../requests"

module square.rb
  class EmployeesClient
  # @return [square.rb::RequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::EmployeesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    #
    # @param location_id [String] 
    # @param status [square.rb::EmployeeStatus] Specifies the EmployeeStatus to filter the employee by.
    # @param limit [Integer] The number of employees to be returned on each page.
    # @param cursor [String] The token required to retrieve the specified page of results.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListEmployeesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.employees.list
    def list(location_id: nil, status: nil, limit: nil, cursor: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "status": status, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/employees"
end
      square.rb::ListEmployeesResponse.from_json(json_object: response.body)
    end
    #
    # @param id [String] UUID for the employee that was requested.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetEmployeeResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.employees.get(id: "id")
    def get(id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/employees/#{id}"
end
      square.rb::GetEmployeeResponse.from_json(json_object: response.body)
    end
  end
  class AsyncEmployeesClient
  # @return [square.rb::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [square.rb::RequestClient] 
    # @return [square.rb::AsyncEmployeesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    #
    # @param location_id [String] 
    # @param status [square.rb::EmployeeStatus] Specifies the EmployeeStatus to filter the employee by.
    # @param limit [Integer] The number of employees to be returned on each page.
    # @param cursor [String] The token required to retrieve the specified page of results.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::ListEmployeesResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.employees.list
    def list(location_id: nil, status: nil, limit: nil, cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "location_id": location_id, "status": status, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/employees"
end
        square.rb::ListEmployeesResponse.from_json(json_object: response.body)
      end
    end
    #
    # @param id [String] UUID for the employee that was requested.
    # @param request_options [square.rb::RequestOptions] 
    # @return [square.rb::GetEmployeeResponse]
    # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.employees.get(id: "id")
    def get(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/employees/#{id}"
end
        square.rb::GetEmployeeResponse.from_json(json_object: response.body)
      end
    end
  end
end