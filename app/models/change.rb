class Change < ApplicationRecord
  validates :price, :pay, presence: true
  validates :price, :pay, numericality: { only_integer: true }
end
