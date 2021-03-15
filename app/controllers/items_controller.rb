class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :feature, :price).merge(user_id: current_user.id)
  end

end
