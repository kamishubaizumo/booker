class BooksController < ApplicationController
  def new
  end

  def create

    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end

    end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    #インスタンス変数を設定。
    @book = Book.find(params[:id])
    


  end

  def edit

    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        redirect_to book_path(@book.id)
    else
      #get path
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end


  private
  #ストロングパラメータ
  #セキュリティに必要なことしかわからん。。
  #マスアサインメント脆弱性
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
