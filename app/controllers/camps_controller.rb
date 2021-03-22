class CampsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_items, only: [:index, :new, :show, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @tags = Tag.all
  end

  def new
    @camp = CampTags.new
  end

  def create
    @camp = CampTags.new(camp_params)
    if @camp.valid?
      @tag_list = camp_params[:style].split(/[[:blank:]]+/).select(&:present?)
      @camp.save(@tag_list)
      save_items
      return redirect_to root_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @camp.update(params_edit)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def camp_params
    params.require(:camp_tags).permit(:title, :image, :place, :style, :text, :day, item_ids: []).merge(user_id: current_user.id)
  end

  def params_edit
    params.require(:camp).permit(:title, :image, :place, :text, :day, item_ids: []).merge(user_id: current_user.id)
  end

  def set_items
    if user_signed_in?
      user = User.find(current_user.id)
      @items = user.items
    end
  end

  def set_item
    @camp = Camp.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user.id == @camp.user_id
  end

  def save_items
    camp = Camp.order(updated_at: :desc).limit(1)
    @camp_id = camp.ids
    @item_ids = @camp.item_ids
    @item_ids.each do |item_id|
      CampItemRelation.create(camp_id: @camp_id[0], item_id: item_id)
    end
  end

end
