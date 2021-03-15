class CreateCampItemRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :camp_item_relations do |t|

      t.timestamps
    end
  end
end
