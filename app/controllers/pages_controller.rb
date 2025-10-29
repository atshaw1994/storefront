class PagesController < ApplicationController
  def index
  end

  def show
    if params[:id] == 'admin'
      @products = Product.all
    elsif params[:id] == 'store'
      @page = (params[:page] || 1).to_i
      per_page = 9
      @products = Product.offset((@page - 1) * per_page).limit(per_page)
      @total_pages = (Product.count / per_page.to_f).ceil
      @cart = Cart.for_session(session.id.to_s)
    end
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