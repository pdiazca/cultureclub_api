class CreateRafflecontestants < ActiveRecord::Migration[5.2]
  def change
    create_table :rafflecontestants do |t|
      t.references :user, foreign_key: true
      t.references :raffle, foreign_key: true

      t.timestamps
    end
  end
end
