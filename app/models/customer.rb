class Customer < ApplicationRecord
  belongs_to :province
  validates :first_name, :last_name, :email, :phone, presence:true
end
