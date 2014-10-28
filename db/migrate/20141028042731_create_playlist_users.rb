class CreatePlaylistUsers < ActiveRecord::Migration
  def change
    create_table :playlist_users do |t|
      t.integer :user_id
      t.integer :playlist_id
      t.timestamps
    end
  end
end
