# frozen_string_literal: true
require 'bcrypt'

class User < ApplicationRecord
  has_one :shopping_cart
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5, maximum: 15 }
  has_secure_password
end
