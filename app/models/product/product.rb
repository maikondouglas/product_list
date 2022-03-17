# frozen_string_literal: true

module Product
  class Product < ApplicationRecord
    include Filterable

    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories

    scope :filter_by_name,        ->(name) { where('name like ?', "%#{name}%") }
    scope :filter_by_description, ->(description) { where('description like ?', "%#{description}%") }
    scope :filter_by_category,    ->(category) { joins(:categories).where(categories: { id: category }) }
    scope :filter_by_price,       ->(price) { where('price <= ?', price) }
  end
end
