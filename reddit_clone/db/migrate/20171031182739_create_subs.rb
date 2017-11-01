class CreateSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :subs do |t|
      t.integer :moderator_id, null: false
      t.string :title, null: false
      t.string :description

      t.timestamps
    end
    add_index :subs, :moderator_id
    add_index :subs, :title, unique: true
  end
end
