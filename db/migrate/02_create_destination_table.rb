class CreateDestinationTable < ActiveRecord::Migration[5.1]
    def change
        create_table :destinations do |t|
            t.string :city
            t.string :start
        end
    end
end