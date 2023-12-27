require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "index" do
    get "/books.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Book.count, data.length
  end

end
