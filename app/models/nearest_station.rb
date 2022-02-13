class NearestStation < ApplicationRecord
  belongs_to :property
  validates :route_name, presence: true, length: { maximum: 50 }
  validates :station, presence: true, length: { maximum: 50 }
  validates :time, presence: true
end
