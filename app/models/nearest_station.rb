class NearestStation < ApplicationRecord
  belongs_to :property
  validates :route_name, presence: false, length: { maximum: 50 }
  validates :station, presence: false, length: { maximum: 50 }
  validates :time, presence: false
end
