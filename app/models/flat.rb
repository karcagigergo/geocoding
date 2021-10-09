class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, length: { maximum: 15,
    too_long: "%{count} characters is the maximum allowed" }
  validates :name, :address, presence: true, uniqueness: true
end
