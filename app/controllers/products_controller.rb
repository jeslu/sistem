class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    #optener todas las categorias de forma acendente y guardarla en la variable @categories
    @categories = Category.all.order(category: :asc).load_async

    if params[:query].present?
      @products = Product.where("code LIKE ?", "%#{params[:query]}%").load_async
    else
      #@products = Product.order(updated_at: :desc).all
       @products = Product.all.with_attached_photo.order(created_at: :desc).load_async
       @products = Product.all.paginate(page: params[:page], per_page: 30).load_async

      if params[:category_id]
          @products = @products.where(category_id: params[:category_id]).load_async
          
         # @pagy, @products = pagy_countless(@products, items: 2)
      end 
      #@products = Product.all.paginate(page: params[:page], per_page: 5)
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
        format.html { redirect_to product_url(@product), notice: t('.created') }
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
        format.html { redirect_to product_url(@product), notice: t('.updated') }
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
      format.html { redirect_to  products_url, notice: t('.destroyed') }
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
      params.require(:product).permit(:name_p, :description, :category_id, :mark_id, :extent_id, :supplier_id, :code, :precio, :costo, :photo, :active)
    end
end
