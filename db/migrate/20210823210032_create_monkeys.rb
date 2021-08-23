class CreateMonkeys < ActiveRecord::Migration[6.0]
  def change
    create_table :monkeys do |t|
      t.string :name
      t.string :species
      t.integer :age
      t.integer :weight
      t.integer :price
      t.text :address
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
