# frozen_string_literal: true

module Category
  class Category < ApplicationRecord
    has_many :product_categories, dependent: :destroy
  end
end
