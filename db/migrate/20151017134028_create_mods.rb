class CreateMods < ActiveRecord::Migration
  def change
    create_table :mods do |t|
      t.string :name
      t.integer :value
      t.belongs_to :item

      t.timestamps null: false
    end
  end
end
