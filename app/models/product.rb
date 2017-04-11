class Product < ApplicationRecord
  attr_accessor :remove_image
  belongs_to :category
  has_many :line_items
  mount_uploader :image, ImageUploader
  validates :category_id, :name, :price, :description, :stock_quantity, presence:true

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
