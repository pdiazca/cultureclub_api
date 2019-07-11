class CreateRaffles < ActiveRecord::Migration[5.2]
  def change
    create_table :raffles do |t|
      t.string :name
      t.text :description
      t.integer :winner

      t.timestamps
    end
  end
end
