class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keyword
      t.integer :count
      t.timestamps
    end

    add_index :searches, :keyword
  end
end
