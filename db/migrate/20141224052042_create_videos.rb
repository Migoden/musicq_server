class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :playlist_id
      t.string :name
      t.string :description
      t.string :source_id
      t.string :video_type, null: false
      t.timestamps
    end

    add_index :videos, :playlist_id, unique: false
  end
end
