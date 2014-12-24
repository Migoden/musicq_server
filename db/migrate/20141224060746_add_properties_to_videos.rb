class AddPropertiesToVideos < ActiveRecord::Migration
 def change
     add_column :videos, :thumbnail_url, :string
     add_column :videos, :thumbnail_width, :string
     add_column :videos, :thumbnail_height, :string
  end
end
