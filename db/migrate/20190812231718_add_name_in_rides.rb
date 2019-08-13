class AddNameInRides < ActiveRecord::Migration[5.2]
  def change

    add_column :rides, :name, :string
  end
end
