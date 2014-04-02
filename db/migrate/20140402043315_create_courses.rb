class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :body
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
