class CuentClientsController < ApplicationController
  before_action :set_cuent_client, only: %i[ show edit update destroy ]

  # GET /cuent_clients or /cuent_clients.json
  def index
    @cuent_clients = CuentClient.all
  end

  # GET /cuent_clients/1 or /cuent_clients/1.json
  def show
  end

  # GET /cuent_clients/new
  def new
    @cuent_client = CuentClient.new
  end

  # GET /cuent_clients/1/edit
  def edit
  end

  # POST /cuent_clients or /cuent_clients.json
  def create
    @cuent_client = current_user.CuentClients.new(cuent_client_params)

    respond_to do |format|
      if @cuent_client.save
        format.html { redirect_to cuent_client_url(@cuent_client), notice: "Cuent client was successfully created." }
        format.json { render :show, status: :created, location: @cuent_client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cuent_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuent_clients/1 or /cuent_clients/1.json
  def update
    respond_to do |format|
      if @cuent_client.update(cuent_client_params)
        format.html { redirect_to cuent_client_url(@cuent_client), notice: "Cuent client was successfully updated." }
        format.json { render :show, status: :ok, location: @cuent_client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cuent_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuent_clients/1 or /cuent_clients/1.json
  def destroy
    @cuent_client.destroy

    respond_to do |format|
      format.html { redirect_to cuent_clients_url, notice: "Cuent client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuent_client
      @cuent_client = CuentClient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cuent_client_params
      params.require(:cuent_client).permit(:client_id, :user_id, :fecha, :active)
    end
end
