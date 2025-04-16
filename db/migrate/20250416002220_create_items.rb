class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :quantity, default: "1 un"
      t.boolean :purchased, default: false

      t.timestamps
    end
  end
end
