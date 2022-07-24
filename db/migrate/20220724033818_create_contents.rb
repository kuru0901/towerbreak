class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title, null: false 
      t.integer :category, default: 0

      t.timestamps
    end
    add_index :contents, [:title, :category], unique: true
  end
end
