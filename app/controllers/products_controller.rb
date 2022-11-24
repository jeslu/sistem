class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    if params[:query].present?
      @products = Product.where("name_p LIKE ?", "%#{params[:query]}%")
    else
      @products = Product.all
    end
    
    if turbo_frame_request?
      render partial: "products", locals: {products: @products}
      else
      render :index
    end
    @product = Product.new
  end

  # GET /products/1 or /products/1.json
  def show
  
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Producto fue Creado exitosamente." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Producto fue actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to  products_url, notice: "Producto fue eliminado." }
      format.json { head :no_content }
    end
  end

  def new_movimient
      @product = Product.find(params[:id])
      @movimient = Movimient.new
  end
  def create_movimient
      @product = Product.find(params[:id])
      @movimient = Movimient.new(movimient_paramas)
      @movimient.product_id = @product.id
      if @movimient.save
          redirect_to @product, notice: 'movimiento realizado con exito'
            else
              flash[:notice] = 'error'
              render :new_movimient, status: :unprocessable_entity
      end    
  end
  def destroy_movimient
    @product = Product.find(params[:id])
      @product.movimients.destroy

    respond_to do |format|
      format.html { redirect_to @product, notice: "movimiento destroyed." }
      format.json { head :no_content }
    end
    
  end
  
  

  private

      def movimient_paramas
        params.require(:movimient).permit(:cant,:tipo,:coment)
        
      end
      
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name_p, :description, :category_id, :mark_id, :extent_id, :code, :stok, :precio, :costo, :active)
    end
end
