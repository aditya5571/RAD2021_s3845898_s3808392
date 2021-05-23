class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy]
  
  
  
  # GET /products or /products.json
  def index
    @category = "Products"
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @availableSizes = ProductVariant.where(product_id: @product.id).distinct("size").pluck("size")
    @availableColours = ProductVariant.where(product_id: @product.id, size: @availableSizes[0]).distinct("colour").pluck("colour")
    @availableQuantity =  ProductVariant.where(product_id: @product.id, size: @availableSizes[0], colour: @availableColours[0]).pluck("quantity")
  end
  
  def setAvailableColours
  
    set_product
    @availableColours =  ProductVariant.where(product_id: @product.id, size: params[:size]).distinct("colour").pluck("colour")
    respond_to do |format|
      format.html
      format.json {render json: @availableColours}
    end
  end
  
  def setAvailableQuantity
    set_product
    @availableQuantity =  ProductVariant.where(product_id: @product.id, size: params[:size], colour: params[:colour]).pluck("quantity")
    respond_to do |format|
      format.html
      format.json {render json: @availableQuantity}
    end
  end
  
  
  def save
    if (cookies[:savedList])
        cookies[:savedList] += " " + params[:id]
    else
        cookies[:savedList] = params[:id]
    end
      redirect_back(fallback_location: root_path)
  end
  
  def unsave

      list = cookies[:savedList].split(" ")
      list.delete(params[:id])
      cookies[:savedList] = list.join(" ")
    set_product
    redirect_back(fallback_location: root_path)
    
  
  end

  # GET /products/new
  def new
    @product = Product.new
  end
  
  def addToCart
    Cart
  end
  
  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
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
        format.html { redirect_to @product, notice: "Product was successfully updated." }
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
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def allWomen
    @category = "Women"
    @products = Product.where(category: "Women")
    render "products/index"
  end
  
  def allMen
    @category = "Men"

    @products = Product.where(category: "Men")
    render "products/index"
  end
  
  def allKids
    @category = "Kids"

    @products = Product.where(category: "Kids")
    render "products/index"
  end
  
  def allNewIns
    @category = "New Ins"

    @products = Product.where(created_at: 3.months.ago..Time.now.end_of_month)
    render "products/index"
  end
  
  def allSavedItems
    @category = "Saved Items"
    @products = Product.where(id: cookies[:savedList].split(" ").map(&:to_i))
  render "products/index"
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:company, :title, :size, :price, :imageString, :action)
    end
    
    
    
end
