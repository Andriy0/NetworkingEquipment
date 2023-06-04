# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def populate_vendors
  %w[
    TP-Link
    ASUS
    D-Link
    NETGEAR
    Blueshadow
    HP
  ].each do |name|
    Vendor.create name: name
  end
end

def populate_adapter_types
  %w[
    internal
    external
  ].each do |name|
    AdapterType.create name: name
  end
end

def populate_connection_types
  %w[
    wired
    wireless
    wired/wireless
  ].each do |name|
    ConnectionType.create name: name
  end
end

def populate_adapters_random(n)
  vendor_ids = Vendor.ids
  adapter_type_ids = AdapterType.ids
  connection_type_ids = ConnectionType.ids

  n.times do
    name = Faker::Hipster.sentence word_count: 5
    vendor = Vendor.find(vendor_ids.sample(1)).first
    adapter_type = AdapterType.find(adapter_type_ids.sample(1)).first
    connection_type = ConnectionType.find(connection_type_ids.sample(1)).first
    Adapter.create name: name, vendor: vendor, adapter_type: adapter_type, connection_type: connection_type
  end
end

populate_vendors
populate_adapter_types
populate_connection_types
populate_adapters_random(30)
