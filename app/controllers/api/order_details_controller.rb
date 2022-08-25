module Api
    class OrderDetailsController < ApplicationController
        
    # GET /product
        def index
            @order_detail = OrderDetail.page(params[:page] || 1).per(params[:per_page] || 10)
                    .order("#{params[:order_by] || 'created_at'} #{params[:order_detail] || 'desc'}")

            serial_order_detail = @order_detail.map { |o| OrderDetailSerializer.new(o, root: false) }

            response_pagination(serial_order_detail, @order_detail, 'List Order Detail')
            # render(json: { data: serial_user }, status: 200)
        end

        # POST /product
        def create
        @order_detail = OrderDetail.new(order_detail_params)

            if @order_detail.save
                render json: @order_detail, status: :created
            else
                render json: @order_detail.errors, status: :unprocessable_entity
            end
        end

        private

        # Only allow a trusted parameter "white list" through.

        def order_detail_params
        params.require(:order_detail).permit( :qty, :price, :order_id, :product_id)
        end

    end
end
