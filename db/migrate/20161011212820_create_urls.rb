class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :target
      t.string :slug
      t.integer :clicks, null: false, default: 0
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
