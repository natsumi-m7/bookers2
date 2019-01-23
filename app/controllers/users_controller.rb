class UsersController < ApplicationController

   before_action :correct_user, only: [:edit, :update]


  def show
  	@user = User.find(params[:id])
  	@book =Book.new
    @books = Book.all

  end


  def edit
    @user = current_user

  end




  def index
  	@users = User.all
    @user = current_user
    @book =Book.new
  end

  def create
  	book = Book.new(book_params)
  	book.user_id = current_user.id
  	book.save
  	redirect_to book_path(book.id)

  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "Update user successfully!!"
  	   redirect_to user_path(@user.id)
      
    else
       render 'edit'
    end

  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end


  private

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end

  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction,:username)
  end

  def book_params
		params.require(:book).permit(:title, :body)
	end


end
