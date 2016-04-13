class AddItemStatusToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_status, :boolean, default: false
  end
end
