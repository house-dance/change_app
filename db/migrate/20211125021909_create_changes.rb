class CreateChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :changes do |t|
      t.integer :price
      t.integer :pay

      t.timestamps
    end
  end
end
