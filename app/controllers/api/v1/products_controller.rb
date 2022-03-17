# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      before_action :find_product, only: %i[show update destroy]

      def index
        products = Product::Product.filter(params.slice(:name, :description, :price, :category))
        render json: { status: 'SUCCESS', message: 'Loaded products', data: products }, status: :ok
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded product', data: @product }, status: :ok
      end

      def create
        product = Product::Product.new(product_params)

        if product.save
          params[:category].each do |category|
            product.categories << Category::Category.find(category)
          end

          render json: { status: 'SUCCESS', message: 'Saved product', data: product }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Product not saved', data: product.errors },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @product.destroy
        render json: { status: 'SUCCESS', message: 'Deleted product', data: @product }, status: :ok
      end

      def update
        if @product.update(product_params.delete_if { |k, _v| k == 'category' })
          @product.categories.clear

          params[:category].each do |category|
            @product.categories << Category::Category.find(category)
          end

          render json: { status: 'SUCCESS', message: 'Updated product', data: @product }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Product not updated', data: @product.errors },
                 status: :unprocessable_entity
        end
      end

      private

      def product_params
        params.require(:product).permit(:name, :description, :price, category: [])
      end

      def find_product
        @product = Product::Product.find(params[:id])
      end
    end
  end
end
