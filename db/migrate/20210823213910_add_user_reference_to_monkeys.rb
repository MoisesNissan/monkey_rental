class AddUserReferenceToMonkeys < ActiveRecord::Migration[6.0]
  def change
    add_reference :monkeys, :user, null: false, foreign_key: true
  end
end
