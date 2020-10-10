class AddEmailToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :email_address, :string
  end
end
