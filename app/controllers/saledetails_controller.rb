class SaledetailsController < ApplicationController
    def index
        @saledetails = Saledetail.all
    end
    
    def create
        @sale = Sale.find(params[:sale_id])
        #@product = Product.find(params[:product_id])
        @Saledetail = @sale.saledetails.create(saledetail_params)
       # @import = (@product.pricio * params[:cantidad].to_i)
        redirect_to edit_sale_path(@sale)
      end

    
    
      private

      def saledetail_params
        params.require(:saledetail).permit(:sale_id, :cantidad, :product_id)
      end
end
