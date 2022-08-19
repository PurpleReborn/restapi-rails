module Api
  class StatusController < ApplicationController

    def index
      @status = Status.all

      render json: @status
    end

    def create
        @status = Status.new(status_params)
  
        if @status.save
          render json: @status, status: :created
        else
          render json: @status.errors, status: :unprocessable_entity
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def status_params
      params.require(:status).permit(:status_name)
    end

  end
end
