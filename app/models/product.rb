# frozen_string_literal: true

class Product < ApplicationRecord
  validates :type_of_product, presence: true
  enum type_of_product: { paintings: 0, photo_prints: 1, sculptures: 2 }
  validates :name, presence: true, length: { maximum: 25 }
  validates :price, presence: true, numericality: true, numericality: { only_integer: true, greater_than: 0 } 
end
