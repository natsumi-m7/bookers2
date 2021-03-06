class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index

  	@books = Book.all
    @user = current_user
    @book =Book.new
  end

  def show
  	@books = Book.find(params[:id])
    @user = current_user
    @book =Book.new


  end

  def edit
  	@book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
    flash[:notice] = "Create book successfully!!"
  	redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update

  	@book = Book.find(params[:id])
  	if @book.update(book_params)
      flash[:notice] = "Update book successfully!!"
  	   redirect_to book_path(@book.id)
    else
        render 'edit'
    end

  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Destroy successfully!!"
  	redirect_to books_path
  end

private

  def correct_user
    @book= Book.find(params[:id])
    user = @book.user
    if current_user != user
      redirect_to root_path
    end
  end

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
