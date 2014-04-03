class RenameTableFromCyclistToUser < ActiveRecord::Migration
  def change
    rename_table :cyclists, :users
  end
end
