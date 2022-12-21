class SalesController < ApplicationController
    #before_action :set_cotiz, only: %i[ show edit update destroy ]
    before_action :set_sale, only: %i[ edit update destroy]
    def index
        @ventas = Sale.all
    end
    def new 
        @user = User.find(params[:id])
        @venta = Sale.create(user_id: @user, import: 0)
        redirect_to edit_sale_path(@venta)

    end

    def edit
        @venta = Sale.find(params[:id])
        @product_venta = @venta.saledetails
    end

    def destroy
        @venta = Sale.find(params[:id])
        @venta.destroy
            respond_to do |format|
                format.html {redirect_to sales_url, notice: "jajaja ya se elimino"  }
                format.json {head :no_conten}
            end    
        
    end
    

    private

    def set_sale

        @venta = Sale.find(params[:id])
    end
    def sale_params
        params.require(:sale).permit(:import, :user_id)
    end
    
    
end