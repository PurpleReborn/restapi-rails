module Api
    class CustomerController < ApplicationController

    # GET /product
    def index
        @customer = Customer.page(params[:page] || 1).per(params[:per_page] || 10)
                .order("#{params[:order_by] || 'created_at'} #{params[:order] || 'desc'}")

        serial_customer = @customer.map { |item| CustomerSerializer.new(item, root: false) }

        response_pagination(serial_customer, @customer, 'List Customer')
        # render(json: { data: serial_user }, status: 200)
    end

    # POST /product
    def create
      @customer = Customer.new(customer_params)

      if @customer.save
        render json: @customer, status: :created
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end

    private

    # Only allow a trusted parameter "white list" through.

    def customer_params
      params.require(:customer).permit(:name, :address, :phone)
    end

    end
end

