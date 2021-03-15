class CampTags

  include ActiveModel::Model
  attr_accessor :title, :style, :user_id

  with_options presence: true do
    validates :title
    validates :style
  end

  def save(tag_list)
    @camp = Camp.create(user_id: user_id, title: title)
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