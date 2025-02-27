require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_url
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { date_time: @appointment.date_time, first_name: @appointment.first_name, last_name: @appointment.last_name, make: @appointment.make, model: @appointment.model, repair_required: @appointment.repair_required, year: @appointment.year } }
    end

    assert_redirected_to new_appointment_url
  end

  test "should create appointment with just an email address" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { email_address: "Text@example.com" } }
    end

    assert_redirected_to new_appointment_url
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should get edit if not already submiited" do
    assert !@appointment.submitted?
    get edit_appointment_url(@appointment)
    assert_response :success
  end

  test "should show if try to edit but already submiited" do
    @appointment.update(submitted: true)
    assert @appointment.reload.submitted?
    get edit_appointment_url(@appointment)
    assert_redirected_to appointment_url(@appointment)
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: { appointment: { date_time: @appointment.date_time, first_name: @appointment.first_name, last_name: @appointment.last_name, make: @appointment.make, model: @appointment.model, repair_required: @appointment.repair_required, year: @appointment.year } }
    assert_redirected_to appointment_url(@appointment)
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete appointment_url(@appointment)
    end

    assert_redirected_to appointments_url
  end

  test "should have submitted attribute be set to true after update" do
    patch appointment_url(@appointment), params: { appointment: { date_time: @appointment.date_time, first_name: @appointment.first_name, last_name: @appointment.last_name, make: @appointment.make, model: @appointment.model, repair_required: @appointment.repair_required, year: @appointment.year } }
    assert_equal Appointment.find(appointments(:one).id).submitted, true
  end
end
