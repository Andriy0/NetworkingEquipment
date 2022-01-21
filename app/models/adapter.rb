class Adapter < ApplicationRecord
  belongs_to :vendor
  belongs_to :adapter_type
  belongs_to :connection_type

  validates :name, presence: true, length: {minimum: 5}
  validates :vendor_id, presence: true
  validates :adapter_type_id, presence: true
  validates :connection_type_id, presence: true

  scope :categorize, ->(vendor_id, adapter_type_id, connection_type_id) do
    adapters = Adapter.all.includes(:vendor).includes(:adapter_type).includes(:connection_type)
    if vendor_id and adapter_type_id and connection_type_id
      adapters = Adapter.where(vendor_id: vendor_id,
                               adapter_type_id: adapter_type_id,
                               connection_type_id: connection_type_id)
    end

    adapters = adapters.order(created_at: :desc)
  end
end
