class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false
      t.string :title, null: false
      t.string :url, null: false
      t.string :content

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
