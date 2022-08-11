class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.string :model
      t.integer :deposit
      t.integer :finance_fee
      t.integer :purchase_fee
      t.decimal :total_payable
      t.integer :duration_months
      t.decimal :apr_rep

      t.timestamps
    end
  end
end
