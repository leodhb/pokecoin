require "test_helper"

class PokemonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemon_index_url
    assert_response :success
  end

  test "should get show" do
    get pokemon_show_url
    assert_response :success
  end

  test "should get checkout" do
    get pokemon_checkout_url
    assert_response :success
  end
end
