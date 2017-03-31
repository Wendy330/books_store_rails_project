class Search < ApplicationRecord
  def search_products
    products = Product.all
    products = products.where(["name ILIKE ?", "%#{keywords}%"]) if keywords.present?
    products = products.where(category_id: category_id) if category_id.present?
    products
  end
end
