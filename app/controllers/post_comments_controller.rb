class PostCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		comment = current_user.post_comments.new(post_comment_params)
		comment.book_id = @book.id
		comment.save
		@post_comments = @book.post_comments

		#非同期通信のため
		#redirect_to book_path(book) 
	end

	def destroy
		post_comment = PostComment.find_by(id: params[:id],book_id: params[:book_id])
		post_comment.destroy
		@book = Book.find(params[:book_id])
		@post_comments = @book.post_comments
		##非同期通信のため
		#redirect_to book_path(params[:book_id])
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)		
	end
end