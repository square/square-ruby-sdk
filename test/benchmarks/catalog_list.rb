# frozen_string_literal: true

# Offline benchmark for #235. No credentials or network access required.
# Run on the original and patched trees with the same Ruby and environment:
#   ruby -Ilib test/benchmarks/catalog_list.rb
# Vary nesting with VARIATIONS=250; optionally use an anonymized response via FIXTURE=path.
require "square_legacy"
require "square"
require "benchmark"

runs = Integer(ENV.fetch("RUNS", "20"))
variation_count = Integer(ENV.fetch("VARIATIONS", "20"))

variation = ->(id) do
  {
    type: "ITEM_VARIATION", id: id, version: 1_700_000_000_000,
    is_deleted: false, present_at_all_locations: false, present_at_location_ids: ["LOCATION"],
    item_variation_data: {
      item_id: "ITEM", name: "Regular", sku: id, pricing_type: "FIXED_PRICING",
      price_money: { amount: 500, currency: "USD" }, track_inventory: true,
      location_overrides: [{ location_id: "LOCATION", track_inventory: true }]
    }
  }
end

body = if ENV["FIXTURE"]
         File.read(ENV.fetch("FIXTURE"))
       else
         objects = Array.new(100) do |i|
           next variation.call("VARIATION-#{i}") if i.odd?

           {
             type: "ITEM", id: "ITEM-#{i}", version: 1_700_000_000_000,
             is_deleted: false, present_at_all_locations: true,
             item_data: {
               name: "Coffee #{i}", description: "Synthetic catalog item", product_type: "REGULAR",
               variations: Array.new(variation_count) { |j| variation.call("VARIATION-#{i}-#{j}") }
             }
           }
         end
         JSON.generate(objects: objects, cursor: "NEXT_PAGE")
       end

puts "Ruby #{RUBY_VERSION}; JSON #{JSON::VERSION}; #{body.bytesize} bytes; #{runs} runs"

measure = ->(label, &block) do
  3.times { block.call }
  GC.start
  allocations = GC.stat(:total_allocated_objects)
  samples = Array.new(runs) { Benchmark.realtime { block.call } }
  allocations = GC.stat(:total_allocated_objects) - allocations
  puts format("%<label>-25s avg=%<avg>8.3f ms min=%<min>8.3f ms allocations/run=%<allocations>d",
              label: label, avg: samples.sum / runs * 1000, min: samples.min * 1000, allocations: allocations / runs)
end

measure.call("Legacy deserialize") { SquareLegacy::APIHelper.json_deserialize(body) }
measure.call("JSON parse only") { JSON.parse(body, symbolize_names: true) }
measure.call("Typed response load") { Square::Types::ListCatalogResponse.load(body) }

# Exercise the customer's first-page call, but replace only the transport.
response = Struct.new(:code, :body).new("200", body)
transport = Object.new
transport.define_singleton_method(:send) { |_request| response }
client = Square::Catalog::Client.new(client: transport)
measure.call("List first page (offline)") { client.list(types: "ITEM,ITEM_VARIATION").pages.next_page.objects.size }
