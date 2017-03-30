class Province < ApplicationRecord
  has_many :customers

  validates :name, :pst, :gst, :hst, presence:true
end
