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

  test "create" do
    assert_difference "Book.count", 1 do
      post "/books.json", params: { title: "lake", author: "arthur", pages: 600 }
      assert_response 200
    end
  end

end
