class CampsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:index, :new, :show, :create]
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
      camp = Camp.order(updated_at: :desc).limit(1)
      @camp_id = camp.ids
      @item_ids = @camp.item_ids
      @item_ids.each do |item_id|
        CampItemRelation.create(camp_id: @camp_id[0], item_id: item_id)
      end
      return redirect_to root_path
    else
      render "new"
    end
  end

  private

  def camp_params
    params.require(:camp_tags).permit(:title, :style, item_ids: []).merge(user_id: current_user.id)
  end

  def set_item
    if user_signed_in?
      user = User.find(current_user.id)
      @items = user.items
    end
  end

end
