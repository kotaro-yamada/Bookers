class FavoritesController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id: @book.id)
		favorite.save
		#非同期通信のためコメントアウト
		#path = Rails.application.routes.recognize_path(request.referer)
		#redirect_to path
	end

	def destroy
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: @book.id)
		favorite.destroy
		#非同期通信のためコメントアウト
		#path = Rails.application.routes.recognize_path(request.referer)
		#redirect_to path
	end
end
