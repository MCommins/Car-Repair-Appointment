class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :first_name
      t.string :last_name
      t.integer :year
      t.string :make
      t.string :model
      t.string :repair_required
      t.datetime :date_time
      t.boolean :submitted

      t.timestamps
    end
  end
end
