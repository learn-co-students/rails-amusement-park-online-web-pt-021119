class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.string :user_id
      t.integer :attraction_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
