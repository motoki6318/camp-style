class CampTags

  include ActiveModel::Model
  attr_accessor :title, :style, :user_id

  with_options presence: true do
    validates :title
    validates :style
  end

  def save
    camp = Camp.create(user_id: user_id, title: title)
    tag = Tag.create(style: style)
    CampTagRelation.create(camp_id: camp.id, tag_id: tag.id)
  end
end