class Category::Category < ApplicationRecord
  has_many :product_categories
end
