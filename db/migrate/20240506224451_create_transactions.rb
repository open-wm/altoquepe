class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.integer :amount_in_cents
      t.string :transaction_number
      t.string :description
      t.references :sender, null: false,  foreign_key: { to_table: :users }
      t.references :receiver, null: false , foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
