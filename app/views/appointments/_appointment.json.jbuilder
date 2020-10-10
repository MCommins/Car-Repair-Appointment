json.extract! appointment, :id, :first_name, :last_name, :year, :phone_number, :email_address, :make, :model, :repair_required, :date_time, :submitted, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
