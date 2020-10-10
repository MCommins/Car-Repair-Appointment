require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  
  test "is valid with no arguments in constructor" do 
    appointment = Appointment.new
    assert appointment.save
  end

  test "submitted attribute is false by default" do
  	appointment = Appointment.new
  	assert (!appointment.submitted.nil? && appointment.submitted == false)
  end
end
