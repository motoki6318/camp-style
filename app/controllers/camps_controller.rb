class CampsController < ApplicationController
  def index
    @tags = Tag.all.includes(:camp)
    @camps = Camp.all.includes(:user)
  end

  def new
    @camp = CampTags.new
  end

  def create
    @camp = CampTags.new(camp_params)
    if @camp.valid?
      @camp.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def camp_params
    params.require(:camp_tags).permit(:title, :style).merge(user_id: current_user.id)
  end

end
