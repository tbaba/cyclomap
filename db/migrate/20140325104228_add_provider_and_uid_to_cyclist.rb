class AddProviderAndUidToCyclist < ActiveRecord::Migration
  def change
    add_column :cyclists, :provider, :string
    add_column :cyclists, :uid, :bigint
  end
end
