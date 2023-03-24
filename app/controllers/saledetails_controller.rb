class SaledetailsController < ApplicationController
  before_action :set_sale
  before_action :set_saledetail, only: %i[ show edit update destroy ]
  
  # GET /saledetails or /saledetails.json
  def index
    @saledetails = @sale.saledetails.all
  end

  # GET /saledetails/1 or /saledetails/1.json
  def show
  end

  # GET /saledetails/new
  def new
    @saledetail = @sale.saledetails.build
  end

  # GET /saledetails/1/edit
  def edit
  end

  # POST /saledetails or /saledetails.json
  def create
    @saledetail = @sale.saledetails.build(saledetail_params)

    respond_to do |format|
      if @saledetail.save
        format.html { redirect_to sale_path(@sale), notice: "Producto Agregado.." }
        format.json { render :show, status: :created, location: @saledetail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saledetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saledetails/1 or /saledetails/1.json
  def update
    respond_to do |format|
      if @saledetail.update(saledetail_params)
        format.html { redirect_to [@sale, @saledetail], notice: "Saledetail was successfully updated." }
        format.json { render :show, status: :ok, location: @saledetail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saledetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saledetails/1 or /saledetails/1.json
  def destroy
    @saledetail.destroy

    respond_to do |format|
      format.html { redirect_to sale_url(@sale), notice: "Producto Quitado." }
      format.json { head :no_content }
    end
  end

  private
  #optener la id de sale
    def set_sale
      @sale = Sale.find(params[:sale_id])

      
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_saledetail
      @saledetail = @sale.saledetails.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saledetail_params
      params.require(:saledetail).permit(:sale_id, :product_id, :cantidad, :importe, :active)
    end
end
