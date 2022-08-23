module Api
    class ProductController < ApplicationController

            # GET /product
    def index
      @product = Product.all

      render json: @product
    end

    # POST /product
    def create
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    private

    # Only allow a trusted parameter "white list" through.

    def product_params
      params.require(:product).permit(:product_name, :description, :price)
    end

    end
end

