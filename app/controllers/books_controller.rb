class BooksController < ApplicationController
  def top
  end

  def index
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
  end

  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice:'Book was successfully created.'
    else
      render:index
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    if book.update(book_params)
       redirect_to book_path(book.id), notice:'Book was successfully update.'
    else
      render:edit
    end
  end

  def destroy
    book=Book.find(params[:id])
    if book.destroy
       redirect_to books_path, notice:'Book was successfully destroy.'
    end
  end

  private
  def book_params
  params.permit( :title, :body)
  end

end