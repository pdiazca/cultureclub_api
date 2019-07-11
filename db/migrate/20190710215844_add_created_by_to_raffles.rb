class AddCreatedByToRaffles < ActiveRecord::Migration[5.2]
  def change
    add_column :raffles, :created_by, :integer
  end
end
