json.extract! appointment, :id, :first_name, :last_name, :year, :make, :model, :repair_required, :date_time, :submitted, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
