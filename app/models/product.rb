# frozen_string_literal: true

class Product < ApplicationRecord
  has_one_attached :image
  has_many :product_shopping_carts, dependent: :destroy
  has_many :shopping_carts, through: :product_shopping_carts
  validates :category, presence: true
            enum category: { paintings: 0, photo_prints: 1, sculptures: 2 }

  validates :category, inclusion: { in: %w(paintings photo_prints sculptures),
            message: '%<value>s is not a valid type of product' }

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, 
            numericality: true, numericality: { only_float: true, greater_than: 0 } 

  validates :description, presence: true, length: { maximum: 250 }

  validate :acceptable_image?

  def acceptable_image?
    return unless image.attached?

    unless image.blob.byte_size <= 1.megabyte
      errors.add(:image, "The size of the picture is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
      unless acceptable_types.include?(image.content_type)
        errors.add(:image, "The picture must be JPEG or PNG")
      end
  end

  scope :sort_by_name, -> { order(name: :desc) }
end
