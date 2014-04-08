class AddStarsCountToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :stars_count, :integer, default: 0
  end
end
