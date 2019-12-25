class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@comment = current_user.book_comments.new(book_comment_params)
		@comment.book_id = @book.id
		if @comment.save
			redirect_to book_path(@book.id)
		else
			@book_comment = BookComment.new
			render "books/show"
		end
	end

	def destroy
		@comment = BookComment.find(params[:id])
  		@comment.destroy
  		redirect_back(fallback_location: root_path)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:user_id, :book_id, :comment)
	end
end
