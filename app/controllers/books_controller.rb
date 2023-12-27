class BooksController < ApplicationController

  def index
    @books = Book.all
    render :index
  end

  def show
    @book = Book.find_by(id: params[:id])
    render :show
  end

  def create
    @book = Book.new(
      title: params[:title],
      author: params[:author],
      pages: params[:pages]
    )
    @book.save
    render :show
  end
end
