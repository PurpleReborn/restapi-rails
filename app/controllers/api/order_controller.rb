module Api
    class OrderController < ApplicationController

        # GET /product
        def index
        @order = Order.all

        render json: @order
        end

        # POST /product
        def create
        @order = Order.new(order_params)

        if @order.save
            render json: @order, status: :created
        else
            render json: @order.errors, status: :unprocessable_entity
        end
        end

        private

        # Only allow a trusted parameter "white list" through.

        def order_params
        params.require(:order).permit( :user_id, :product_id, :payment_method, :amount)
        end

        def user_params
        # params.permit(:email, :password, profile: %i[:full_name, :city])
        params.fetch(:order, {})
          .permit(:payment_method, :amount, products_attributes: 
            %i[
              id email
            ])

        end

        
    end
end
