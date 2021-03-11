class CampsController < ApplicationController
  def index
    @camps = Camp.all.includes(:user)
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new
    if @camp.save
      redirect_to root_path
    else
      render :new
    end
  end
  
end
