class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		@user = @book.user
		@book_comments = @book.book_comments
		@book_comment= @book.book_comments.build(book_comment_params)
		@book_comment.user_id = current_user.id
		@book_comment.save!
	end

	def destroy
		@book = Book.find(params[:book_id])
		@book_comment = @book.book_comments.find(params[:id])
		if @book_comment.user != current_user
			redirect_to request.referer
		end
		@book_comment.destroy
		redirect_to request.referer
	end


	private
	def book_comment_params
		params.require(:book_comment).permit(:content,:book_id,:user_id)
	end
end
