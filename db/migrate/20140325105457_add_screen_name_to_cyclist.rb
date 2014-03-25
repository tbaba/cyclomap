class AddScreenNameToCyclist < ActiveRecord::Migration
  def change
    add_column :cyclists, :screen_name, :string
  end
end
