module Api
    class ProductController < ApplicationController

    # GET /product
    def index
        @product = Product.page(params[:page] || 1).per(params[:per_page] || 10)
                .order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

        serial_product = @product.map { |user| ProductSerializer.new(user, root: false) }

        response_pagination(serial_product, @product, 'List Product')
        # render(json: { data: serial_user }, status: 200)
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
      params.require(:product).permit(:name, :description, :price)
    end

    end
end

