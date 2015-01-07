require 'test_helper'

class AddBooksTest < ActionDispatch::IntegrationTest
  
  def setup
    @book = Book.new(title: "Book 1", author: "Author 1")
  end
  
  test "should not add duplicates" do
    get addbook_path
    assert_difference 'Book.count', 1 do
      post_via_redirect books_path, book: { title: "Book 1", author: "Author 1" }
    end
    assert_template 'books/index'
    get addbook_path
    assert_no_difference 'Book.count' do
      post books_path, book: { title: "Book 1", author: "Author 1" }
    end
  end
  
end
