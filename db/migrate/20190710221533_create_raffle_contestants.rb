class CreateRaffleContestants < ActiveRecord::Migration[5.2]
  def change
    create_table :raffle_contestants do |t|
      t.references :user_id, foreign_key: true
      t.references :raffle_id, foreign_key: true

      t.timestamps
    end
  end
end
