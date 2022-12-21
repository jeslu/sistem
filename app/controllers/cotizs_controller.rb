class CotizsController < ApplicationController
  before_action :set_cotiz, only: %i[ show edit update destroy ]

  # GET /cotizs or /cotizs.json
  def index
    @cotizs = Cotiz.all
  end

  # GET /cotizs/1 or /cotizs/1.json
  def show
  end

  # GET /cotizs/new
  def new
    @cotiz = Cotiz.new
  end

  # GET /cotizs/1/edit
  def edit
  end

  # POST /cotizs or /cotizs.json
  def create
    @cotiz = current_user.Cotizs.new(cotiz_params)

    respond_to do |format|
      if @cotiz.save
        format.html { redirect_to cotiz_url(@cotiz), notice: "Cotizacion fue creado con exito..." }
        format.json { render :show, status: :created, location: @cotiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cotiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cotizs/1 or /cotizs/1.json
  def update
    respond_to do |format|
      if @cotiz.update(cotiz_params)
        format.html { redirect_to cotiz_url(@cotiz), notice: "Cotizacion fue actualizado conexito ..." }
        format.json { render :show, status: :ok, location: @cotiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cotiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cotizs/1 or /cotizs/1.json
  def destroy
    @cotiz.destroy

    respond_to do |format|
      format.html { redirect_to cotizs_url, notice: "Cotizacion fue elimnido con exito..." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cotiz
      @cotiz = Cotiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cotiz_params
      params.require(:cotiz).permit(:client_id, :user_id, :fecha)
    end
end
