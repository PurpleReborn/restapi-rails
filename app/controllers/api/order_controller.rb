module Api
    class OrderController < ApplicationController

        # GET /product
        def index
            @order = Order.page(params[:page] || 1).per(params[:per_page] || 10)
                    .order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

            serial_order = @order.map { |o| OrderSerializer.new(o, root: false) }

            response_pagination(serial_order, @order, 'List Order')
            # render(json: { data: serial_user }, status: 200)
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
        params.require(:order).permit( :status, :date, :total, :customer_id)
        end
        
    end
end
