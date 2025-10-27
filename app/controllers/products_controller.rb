class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to page_path('admin'), notice: 'Product created.'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to page_path('admin'), notice: 'Product deleted.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image_url, :price)
  end

end
