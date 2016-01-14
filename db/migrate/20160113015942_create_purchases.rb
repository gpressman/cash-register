class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :codes
      t.decimal :total

      t.timestamps null: false
    end
  end
end
