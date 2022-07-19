class AcountsController < ApplicationController
  before_action :set_client
  before_action :set_acount, only: %i[ show edit update destroy ]

  # GET /acounts or /acounts.json
  def index
    @acounts = @client.acounts.all
  end

  # GET /acounts/1 or /acounts/1.json
  def show
  end

  # GET /acounts/new
  def new
    @acount = @client.acounts.build
  end

  # GET /acounts/1/edit
  def edit
  end

  # POST /acounts or /acounts.json
  def create
    @acount = @client.acounts.build(acount_params)

    respond_to do |format|
      if @acount.save
        format.html { redirect_to client_path(@client), notice: "SE agrego Movimiento o deuda al Cliente." }
        format.json { render :show, status: :created, location: @acount }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @acount.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acounts/1 or /acounts/1.json
  def update
    respond_to do |format|
      if @acount.update(acount_params)
        format.html { redirect_to client_path(@client), notice: "Cuenta del Cliente fue actualizado." }
        format.json { render :show, status: :ok, location: @acount }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @acount.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acounts/1 or /acounts/1.json
  def destroy
    @acount.destroy

    respond_to do |format|
      format.html { redirect_to client_url(@client), notice: "Movimiento o Deuda fue Eliminado." }
      format.json { head :no_content }
    end
  end

  private

    def set_client
     @client = Client.find(params[:client_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_acount
      @acount = @client.acounts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def acount_params
      params.require(:acount).permit(:client_id, :fecha, :description, :importe, :active)
    end
end
