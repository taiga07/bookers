class BooksController < ApplicationController
  def top
  end

  def index
    @books=Book.all
    @book=Book.new
    # 本来はnewアクション内に記載だが、今回は一覧ページに新規投稿画面が存在している為、
    # indexアクション内に記載する。
  end

  def show
    @book=Book.find(params[:id])
  end

  def create
    @book=Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice:'Book was successfully created.'
    else
      @books=Book.all
      # 遷移する先に定義されているインスタンス変数を全部createアクション内に定義する必要がある。
      render:index
    end
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id), notice:'Book was successfully update.'
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
  params.require(:book).permit( :title, :body)
  end

end