class Product < ApplicationRecord
  attr_accessor :remove_image
  belongs_to :category
  mount_uploader :image, ImageUploader
  validates :category_id, :name, :price, :description, :stock_quantity, presence:true
  #
  # def remove_image
  #   @remove_image || false
  # end
  #
  # before_validation { self.image.clear if self.remove_image == '1' }
end
