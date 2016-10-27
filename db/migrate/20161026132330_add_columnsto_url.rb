class AddColumnstoUrl < ActiveRecord::Migration
  def change
    add_column :urls, :title, :string
    add_column :urls, :status, :boolean, default: true
  end
end
