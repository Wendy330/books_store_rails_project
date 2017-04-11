class Customer < ApplicationRecord
  belongs_to :province
  has_many :orders
  validates :first_name, :last_name, :email, :phone, presence:true
end
