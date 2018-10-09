class BooksController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    #fail
    case params[:scope]
    when "past"
      @books = Book.past
    when "free"
      @books = Book.free
    when "recent"
      @books = Book.recent(4)
    else
      @books = Book.all
    end
  end

  def show
    @likers = @book.likes
    @categories = @book.categories
    if current_user
      @current_like = current_user.likes.find_by(book_id: @book.id)
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book successfully updated!"
    else
      render :edit
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book successfully created!"
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, alert: "Book successfully deleted!"
  end

private

  def book_params
    params.require(:book).
      permit(:title, :author, :description, :released_on, :book_image_name, :price, category_ids: [])
  end

  def set_book
    @book = Book.find_by!(slug: params[:id])
  end
end
