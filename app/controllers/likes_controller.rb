class LikesController < ApplicationController
	before_action :require_signin

	def create
		@book = Book.find_by!(slug: params[:book_id])
		@book.likes.create!(user: current_user)
		redirect_to @book, notice: "Glad you like it!"
	end

	def destroy
		like = current_user.likes.find(params[:id])
		like.destroy

		@book = Book.find_by!(slug: params[:book_id])
		redirect_to @book, notice: "Sorry you didn't like it!"
	end
end
