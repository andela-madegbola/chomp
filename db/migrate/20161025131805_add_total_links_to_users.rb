class AddTotalLinksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_links, :integer
  end
end
