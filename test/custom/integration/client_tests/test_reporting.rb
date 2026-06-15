# frozen_string_literal: true

require "custom/test_helper"
require "square/reporting_helper"

# Live smoke test for the Reporting API (client.reporting.*) and the custom
# load_and_wait polling helper.
#
# The Reporting API is PRODUCTION-ONLY: sandbox returns 404, and a sandbox token
# against production returns 401. End-to-end runs therefore need a production,
# reporting-provisioned Square token, which CI does not have. This suite is
# OPT-IN: it skips entirely unless TEST_SQUARE_REPORTING is set, and reuses the
# TEST_SQUARE_TOKEN credential when it runs.
describe Square::Reporting::Client do
  before do
    skip "set TEST_SQUARE_REPORTING=1 (and TEST_SQUARE_TOKEN) to run the live Reporting suite" unless ENV["TEST_SQUARE_REPORTING"]

    token = ENV.fetch("TEST_SQUARE_TOKEN", nil) || ENV.fetch("SQUARE_TOKEN", nil)
    skip "TEST_SQUARE_TOKEN (or SQUARE_TOKEN) required for the live Reporting suite" if token.nil?

    @reporting_client = Square::Client.new(
      token: token,
      base_url: Square::Environment::PRODUCTION
    )
  end

  describe "#get_metadata" do
    it "discovers the reporting schema" do
      response = @reporting_client.reporting.get_metadata

      refute_nil response
      assert_instance_of Square::Types::MetadataResponse, response

      puts "metadata #{response.to_h}" if verbose?
    end
  end

  describe "#load" do
    it "returns results or the Continue-wait sentinel" do
      response = @reporting_client.reporting.load(query: {})

      refute_nil response
      assert_instance_of Square::Types::LoadResponse, response

      # A still-processing query comes back as the Continue-wait sentinel;
      # otherwise results are present. Both are valid here.
      sentinel = response.to_h["error"] == "Continue wait"

      assert(sentinel || !response.results.nil?, "expected results or the Continue-wait sentinel")

      puts "load sentinel=#{sentinel} #{response.to_h}" if verbose?
    end
  end

  describe "#load_and_wait" do
    it "polls until the query resolves" do
      response = @reporting_client.reporting.load_and_wait(query: {})

      refute_nil response
      assert_instance_of Square::Types::LoadResponse, response
      # Once load_and_wait returns, the query has resolved — never the sentinel.
      refute_equal "Continue wait", response.to_h["error"]

      puts "load_and_wait #{response.to_h}" if verbose?
    end
  end
end
