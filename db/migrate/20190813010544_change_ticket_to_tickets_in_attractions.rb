class ChangeTicketToTicketsInAttractions < ActiveRecord::Migration[5.2]
  def change
    rename_column :attractions, :ticket, :tickets
  end
end
