class AddListStatusToLists < ActiveRecord::Migration
  def change
    add_column :lists, :list_status, :boolean, default: false
  end
end
