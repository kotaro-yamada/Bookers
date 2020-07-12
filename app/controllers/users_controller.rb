class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books.page(params[:page]).reverse_order
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
		 redirect_to books_path
		else
		end
	end	

	def create
=begin		@book = Book.new(book_params)
		if @book.save
			flash[:notice] = "You have creatad book successfully."
            redirect_to book_path(@book.id)
        else
        	render template: "book/index"
        end
=end
	end

	def index
		@user = current_user
		@book = Book.new
		@users = User.all
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

	def book_params
		params.require(:book).permit(:title, :body)
	end
end
