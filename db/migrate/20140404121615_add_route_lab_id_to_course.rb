class AddRouteLabIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :route_lab_id, :string
  end
end
