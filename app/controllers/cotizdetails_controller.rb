class CotizdetailsController < ApplicationController
  before_action :set_cotiz
  before_action :set_cotizdetail, only: %i[ show edit update destroy ]

  # GET /cotizdetails or /cotizdetails.json
  def index
    @cotizdetails = @cotiz.cotizdetails.all
    
  end

  # GET /cotizdetails/1 or /cotizdetails/1.json
  def show
  end

  # GET /cotizdetails/new
  def new
    @cotizdetail = @cotiz.cotizdetails.build
  end

  # GET /cotizdetails/1/edit
  def edit
  end

  # POST /cotizdetails or /cotizdetails.json
  def create
    @cotizdetail = @cotiz.cotizdetails.build(cotizdetail_params)
    

    respond_to do |format|
      if @cotizdetail.save
        format.html { redirect_to cotiz_path(@cotiz), notice: "Cotizdetail was successfully created." }
        format.json { render :show, status: :created, location: @cotizdetail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cotizdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cotizdetails/1 or /cotizdetails/1.json
  def update
    respond_to do |format|
      if @cotizdetail.update(cotizdetail_params)
        format.html { redirect_to [@cotiz, @cotizdetail], notice: "Cotizdetail was successfully updated." }
        format.json { render :show, status: :ok, location: @cotizdetail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cotizdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cotizdetails/1 or /cotizdetails/1.json
  def destroy
    @cotizdetail.destroy

    respond_to do |format|
      format.html { redirect_to cotiz_url(@cotiz), notice: "Cotizdetail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # optener las id de cotiz

  
    def set_cotiz
      @cotiz = Cotiz.find(params[:cotiz_id])
      
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_cotizdetail
      @cotizdetail = @cotiz.cotizdetails.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cotizdetail_params
      params.require(:cotizdetail).permit(:cotiz_id, :product_id, :servicio_id, :cant, :total, :active)
    end
end
