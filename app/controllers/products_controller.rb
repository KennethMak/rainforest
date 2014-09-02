class ProductsController < ApplicationController
	before_filter :find_product, only: [:show, :edit, :update, :destroy]

  def index
  	@products = Product.all
  end

  def show
  	if current_user
  		@review = @product.reviews.build
  	end
  end

  def new
  	@product = Product.new
  end

  def edit
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  		redirect_to products_url 	
  	else
  		render :new
  	end
  end

  def update
  	if @product.update_attributes(product_params)
  	 redirect to products_url(@product)
  	else
  	 render :edit
    end
  end

  def destroy
  	@product.destroy
  	redirect_to products_path
  end

  private
  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end

  def find_product
  	@product = Product.find(params[:id])
  end

end
