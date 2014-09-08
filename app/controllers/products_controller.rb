class ProductsController < ApplicationController

  before_action :authenticate_user! , :except => [:index , :show , :view , :view_category]
 # before_action :set_product, only: [:show, :edit, :update, :destroy , :search , :view , :view_category]
  # GET /products
  # GET /products.json
  def index
    @products =  Product.all
    @categories= Category.all
    if !params[:search].blank?
      @products = Product.where(:title => params[:search])
    end
  end

  def view
  info = params[:product]
  @category=info["category_id"]
  if @category.eql?("1")
    redirect_to products_path
  else
  @products=Product.where(:category_id => @category)
  end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  def crop
    @product = Product.find(params[:id])
  end

 def search

   @products = Product.find_by_title(params[:search])
   redirect_to products_path

 end

 def view_category
 @categories= Category.all
 end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      end
    else
      format.html { render :edit }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  #  def set_product
 #     @product = Product.find(params[:id])
 #   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product, :user_id, :title, :description, :price , :pic , :category_id)
    end
end
