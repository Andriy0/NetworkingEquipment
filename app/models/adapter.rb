class Adapter < ApplicationRecord
  belongs_to :vendor
  belongs_to :adapter_type
  belongs_to :connection_type

  validates :name, presence: true, length: {minimum: 5}
  validates :vendor_id, presence: true
  validates :adapter_type_id, presence: true
  validates :connection_type_id, presence: true
end
