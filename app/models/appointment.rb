class Appointment < ApplicationRecord
	after_initialize :set_default_values

	def set_default_values
		self.submitted ||= false
	end
end
