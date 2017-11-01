class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.string :upvote_type
      t.references :upvotable, polymorphic: true, index: true
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
