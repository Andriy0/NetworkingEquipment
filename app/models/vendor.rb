class Vendor < ApplicationRecord
  has_many :adapters, dependent: :destroy

  validates :name, presence: true
end
