class CreateTravellerTable < ActiveRecord::Migration[5.1]
    def change
        create_table :travellers do |t|
            t.string :name
            t.integer :budget
            t.string :start
        end
    end
end