class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone
      t.string :name
      t.integer :balance_in_cents
      t.date :date_of_birth
      t.datetime :last_transaction

      t.timestamps
    end
  end
end
