class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_items, only: [:new, :show, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :feature, :price).merge(user_id: current_user.id)
  end

  def set_items
    if user_signed_in?
      user = User.find(current_user.id)
      @items = user.items
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @item.user_id
  end

end