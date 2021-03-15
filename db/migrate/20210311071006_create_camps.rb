class CreateCamps < ActiveRecord::Migration[6.0]
  def change
    create_table :camps do |t|
      t.references :user,  null: false, foreign_key: true
      t.string     :title, null: false
      t.timestamps
    end
  end
end
