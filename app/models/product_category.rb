# frozen_string_literal: true

class ProductCategory < ApplicationRecord
  belongs_to :product, class_name: 'Product::Product'
  belongs_to :category, class_name: 'Category::Category'
end
