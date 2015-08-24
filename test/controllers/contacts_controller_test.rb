require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { city: @contact.city, email: @contact.email, event_details: @contact.event_details, name: @contact.name, organization: @contact.organization, past_events_speaker: @contact.past_events_speaker, phone_number: @contact.phone_number, profession: @contact.profession, request_details: @contact.request_details, zip_code: @contact.zip_code }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { city: @contact.city, email: @contact.email, event_details: @contact.event_details, name: @contact.name, organization: @contact.organization, past_events_speaker: @contact.past_events_speaker, phone_number: @contact.phone_number, profession: @contact.profession, request_details: @contact.request_details, zip_code: @contact.zip_code }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
