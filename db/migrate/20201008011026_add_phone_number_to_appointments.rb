class AddPhoneNumberToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :phone_number, :string
  end
end
