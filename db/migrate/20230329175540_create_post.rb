class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :Title
      t.text :Text
      t.integer :CommentsCounter
      t.integer :LikesCounter
      t.belongs_to :author, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
