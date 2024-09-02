require "application_system_test_case"

class OpinionsTest < ApplicationSystemTestCase
  setup do
    @opinion = opinions(:one)
  end

  test "visiting the index" do
    visit opinions_url
    assert_selector "h1", text: "Opinions"
  end

  test "should create opinion" do
    visit opinions_url
    click_on "New opinion"

    fill_in "Comment", with: @opinion.comment
    fill_in "Hotel", with: @opinion.hotel_id
    fill_in "Rating", with: @opinion.rating
    fill_in "Room", with: @opinion.room_id
    fill_in "User", with: @opinion.user_id
    click_on "Create Opinion"

    assert_text "Opinion was successfully created"
    click_on "Back"
  end

  test "should update Opinion" do
    visit opinion_url(@opinion)
    click_on "Edit this opinion", match: :first

    fill_in "Comment", with: @opinion.comment
    fill_in "Hotel", with: @opinion.hotel_id
    fill_in "Rating", with: @opinion.rating
    fill_in "Room", with: @opinion.room_id
    fill_in "User", with: @opinion.user_id
    click_on "Update Opinion"

    assert_text "Opinion was successfully updated"
    click_on "Back"
  end

  test "should destroy Opinion" do
    visit opinion_url(@opinion)
    click_on "Destroy this opinion", match: :first

    assert_text "Opinion was successfully destroyed"
  end
end
