class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,       null: false, foreign_key: true
      t.integer    :genre_id,   null: false
      t.string     :name,       null: false
      t.string     :feature,    null: false
      t.integer    :price,      null: false
      t.timestamps
    end
  end
end
