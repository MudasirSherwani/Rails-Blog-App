class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comment_counter
      t.integer :like_counter
      t.belongs_to :author, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
    change_column :posts, :comment_counter, :integer, default: 0
    change_column :posts, :like_counter, :integer, default: 0
  end
end