class Adapter < ApplicationRecord
  belongs_to :vendor
  belongs_to :adapter_type
  belongs_to :connection_type

  validates :name, presence: true, length: { minimum: 5 }
  validates :vendor_id, presence: true
  validates :adapter_type_id, presence: true
  validates :connection_type_id, presence: true

  scope :categorize, lambda { |vendor_id, adapter_type_id, connection_type_id|
    adapters = Adapter.all.includes(:vendor, :adapter_type, :connection_type)
    if vendor_id || adapter_type_id || connection_type_id
      search_params = { vendor_id: vendor_id,
                        adapter_type_id: adapter_type_id,
                        connection_type_id: connection_type_id }
                      .reject { |_key, val| val.blank? }

      adapters = adapters.where search_params
    end

    adapters.order(created_at: :desc)
  }
end
