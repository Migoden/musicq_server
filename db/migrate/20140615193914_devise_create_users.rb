class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|

      t.string :name, :null => false, :default => ""
      t.string :twitter_id, :null => false, :default => ""

      t.timestamps
    end

    add_index :users, :name,                unique: true
    add_index :users, :twitter_id,          unique: true
  end
end
