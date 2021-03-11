class CreateCampTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :camp_tag_relations do |t|
      t.references :camp, null: false, foreign_key: true
      t.references :tag,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
