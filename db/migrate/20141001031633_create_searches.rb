class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keyword, null: false
      t.integer :count, default: 1
      t.timestamps
    end

    add_index :searches, :keyword
  end
end
