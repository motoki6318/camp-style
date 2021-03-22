class CampTags

  include ActiveModel::Model
  attr_accessor :title, :place, :style, :text, :day, :user_id, :item_ids

  with_options presence: true do
    validates :user_id
    validates :title
    validates :place
    validates :day
    validates :style
    validates :item_ids
  end

  def save(tag_list)
    @camp = Camp.create(user_id: user_id, title: title, place: place, text: text, day: day)
    tag_list.each do |tag|
      unless Tag.find_by(style: tag)
        @tag = Tag.create(style: tag)
        CampTagRelation.create(camp_id: @camp.id, tag_id: @tag.id)
      else
        @tag_id = Tag.find_by(style: tag)
        CampTagRelation.create(camp_id: @camp.id, tag_id: @tag_id.id)
      end
    end
  end

end