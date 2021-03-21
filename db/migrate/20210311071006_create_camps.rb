class CreateCamps < ActiveRecord::Migration[6.0]
  def change
    create_table :camps do |t|
      t.references :user,  null: false, foreign_key: true
      t.string     :title, null: false
      t.text       :text
      t.date       :the_day, null: false
      t.timestamps
    end
  end
end
