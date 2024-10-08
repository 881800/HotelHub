require "test_helper"

class OpinionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opinion = opinions(:one)
  end

  test "should get index" do
    get opinions_url
    assert_response :success
  end

  test "should get new" do
    get new_opinion_url
    assert_response :success
  end

  test "should create opinion" do
    assert_difference("Opinion.count") do
      post opinions_url, params: { opinion: { comment: @opinion.comment, hotel_id: @opinion.hotel_id, rating: @opinion.rating, room_id: @opinion.room_id, user_id: @opinion.user_id } }
    end

    assert_redirected_to opinion_url(Opinion.last)
  end

  test "should show opinion" do
    get opinion_url(@opinion)
    assert_response :success
  end

  test "should get edit" do
    get edit_opinion_url(@opinion)
    assert_response :success
  end

  test "should update opinion" do
    patch opinion_url(@opinion), params: { opinion: { comment: @opinion.comment, hotel_id: @opinion.hotel_id, rating: @opinion.rating, room_id: @opinion.room_id, user_id: @opinion.user_id } }
    assert_redirected_to opinion_url(@opinion)
  end

  test "should destroy opinion" do
    assert_difference("Opinion.count", -1) do
      delete opinion_url(@opinion)
    end

    assert_redirected_to opinions_url
  end
end
