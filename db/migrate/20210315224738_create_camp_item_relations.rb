class CreateCampItemRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :camp_item_relations do |t|
      t.references :camp, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
