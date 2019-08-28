require 'test_helper'

class PlaylistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get playlists_new_url
    assert_response :success
  end

  test "should get update" do
    get playlists_update_url
    assert_response :success
  end

  test "should get edit" do
    get playlists_edit_url
    assert_response :success
  end

end
