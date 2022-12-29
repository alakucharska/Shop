# frozen_string_literal: true

class Product < ApplicationRecord
  validates :category, presence: true
            enum category: { paintings: 0, photo_prints: 1, sculptures: 2 }

  validates :category, inclusion: { in: %w(paintings photo_prints sculptures),
            message: '%<value>s is not a valid type of product' }

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, 
            numericality: true, numericality: { only_float: true, greater_than: 0 } 

  validates :description, presence: true, length: { maximum: 250 }
end
