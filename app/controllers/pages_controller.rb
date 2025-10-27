class PagesController < ApplicationController
  def index
  end

  def show
    @products = Product.all if params[:id] == 'admin'
    render params[:id]
  end

  def home
    render :home
  end

  def cart
    render :cart
  end

  def contact
    render :contact
  end

  def about
    render :about
  end

  def admin
    @products = Product.all
    render :admin
  end
end