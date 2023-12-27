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

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(
      title: params[:title] || @book.title,
      author: params[:author] || @book.author,
      pages: params[:pages] || @book.pages
    )
    render :show
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    render json: {message: "Book Destroyed"}
  end

end
