class CreateBookingTable < ActiveRecord::Migration[5.1]
    def change
        create_table :bookings do |t|
            t.integer :price
            t.integer :traveller_id
            t.integer :destination_id
        end
    end
end