class CreateActives < ActiveRecord::Migration[7.0]
  def change
    create_table :actives do |t|
      t.string :name
      t.decimal :amount
      t.datetime :open_in

      t.timestamps
    end
  end
end
