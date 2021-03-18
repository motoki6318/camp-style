class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_item, only: [:new, :show]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :feature, :price).merge(user_id: current_user.id)
  end

  def set_item
    if user_signed_in?
      user = User.find(current_user.id)
      @items = user.items
    end
  end

end