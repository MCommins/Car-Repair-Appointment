class Appointment < ApplicationRecord
	after_initialize :set_default_values
	before_update :confirm_submitted

	def set_default_values
		self.submitted ||= false
	end

	def confirm_submitted
		self.submitted = true;
	end
end
