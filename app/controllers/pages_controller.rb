class PagesController < ApplicationController
  def index
  end

  def show
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
end