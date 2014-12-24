class ChangeThumbnailWidthToInteger < ActiveRecord::Migration
  def change
  	remove_column :videos, :thumbnail_width
    add_column :videos, :thumbnail_width, :integer


  	remove_column :videos, :thumbnail_height
    add_column :videos, :thumbnail_height, :integer
  end
end
