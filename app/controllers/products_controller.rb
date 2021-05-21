class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy]
  
  @category
  
  # GET /products or /products.json
  def index
    @category = "Products"
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end
  
  def editList
    if params[:method] == "save"
      if (cookies[:savedList])
        cookies[:savedList] += " " + params[:id]
      else
        cookies[:savedList] = params[:id]
      end
    elsif params[:method] == "unsave"
      list = cookies[:savedList].split(" ")
      list.delete(params[:id])
      cookies[:savedList] = list.join(" ")
      # format.js
    end
    set_product
    render :show
    
  
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
  
  # POST /products/1
  def saveToSaveList
    if(product_params[:commit] == "Like")
      cookies[:savedProducts] = cookies[:savedProducts]+" "+params[:id]
      @savedItems = cookies[:savedProducts]
    elsif (product_params[:commit] == "Add To Cart")
      User.find_by(id: session[:current_user]).cart.add(@product)
    end
  end
  
  def save
    cookies[:savedProducts] = cookies[:savedProducts]+" "+params[:id]
    @savedList = cookies[:savedProducts].split(" ")
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
  end
  
  def allMen
    @category = "Men"

    @products = Product.where(category: "Men")
  end
  
  def allKids
    @category = "Kids"

    @products = Product.where(category: "Kids")
  end
  
  def allNewIns
    @category = "New Ins"

    @products = Product.where(created_at: 3.months.ago..Time.now.end_of_month)
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
