require 'test_helper'

class BulatTeamMembersControllerTest < ActionController::TestCase
  setup do
    @bulat_team_member = bulat_team_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bulat_team_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bulat_team_member" do
    assert_difference('BulatTeamMember.count') do
      post :create, bulat_team_member: { image: @bulat_team_member.image, link: @bulat_team_member.link, title: @bulat_team_member.title }
    end

    assert_redirected_to bulat_team_member_path(assigns(:bulat_team_member))
  end

  test "should show bulat_team_member" do
    get :show, id: @bulat_team_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bulat_team_member
    assert_response :success
  end

  test "should update bulat_team_member" do
    patch :update, id: @bulat_team_member, bulat_team_member: { image: @bulat_team_member.image, link: @bulat_team_member.link, title: @bulat_team_member.title }
    assert_redirected_to bulat_team_member_path(assigns(:bulat_team_member))
  end

  test "should destroy bulat_team_member" do
    assert_difference('BulatTeamMember.count', -1) do
      delete :destroy, id: @bulat_team_member
    end

    assert_redirected_to bulat_team_members_path
  end
end
