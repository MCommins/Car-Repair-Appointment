class Appointment < ApplicationRecord
	after_initialize :set_initial_values
	before_update :confirm_submitted

	def set_initial_values
		self.submitted ||= false
	end

	def confirm_submitted
		self.submitted = true;
	end

end
