class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :int
      t.integer :str
      t.integer :dex
      t.string :name
      t.string :affix
      t.string :prefix
      t.integer :level
      t.string :rarity
      t.integer :league_id

      t.timestamps null: false
    end
  end
end
