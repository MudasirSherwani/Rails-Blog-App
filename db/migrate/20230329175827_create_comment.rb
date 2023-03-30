class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :users, null: false, foreign_key: true
      t.belongs_to :posts, null: false, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end