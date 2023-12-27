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

  test "show" do
    get "/books/#{Book.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "author", "pages", "created_at", "updated_at"], data.keys
  end

  test "update" do
    book = Book.first
    patch "/books/#{book.id}.json", params: { title: "Updated title"
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

end
