class Product::Product < ApplicationRecord
  include Filterable

  has_many :product_categories
  has_many :categories, through: :product_categories

  scope :filter_by_name, -> (name) { where("name like ?", "%#{name}%") }
  scope :filter_by_description, -> (description) { where("description like ?", "%#{description}%") }
  scope :filter_by_category, -> (category) { joins(:categories).where(categories: {id: category}) }
  scope :filter_by_price, -> (price) { where("price <= ?", price) }

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
  # validates :price, numericality: {greater_than_or_equal_to: 0}
end
