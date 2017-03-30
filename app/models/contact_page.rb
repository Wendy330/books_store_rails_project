class ContactPage < ApplicationRecord
  validates :title, :contentAddress, presence:true
end
