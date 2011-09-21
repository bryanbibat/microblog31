class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :message
      t.references :user

      t.timestamps
    end
    add_index :tweets, :user_id
  end
end
