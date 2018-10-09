class ReviewsController < ApplicationController
	before_action :require_signin, except: ["show", "index"]
	before_action :set_book

	def new
		@review = @book.reviews.new
	end

	def create
		@review = @book.reviews.new(review_params)
		@review.user = current_user
		if @review.save
			redirect_to book_reviews_url(@book), notice: "Review created successfully!"
		else
			render :new
		end
	end

	def index
		@reviews = @book.reviews
	end

	def show
		@review = Review.find(params[:id])
	end

	def edit
		@review = Review.find(params[:id])
		@user = @review.user
		@book = Book.find_by!(slug: params[:book_id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)
			redirect_to book_reviews_url(@book), notice: "Review updated successfully!"
		else
			render :edit
		end
	end

private
	def set_book
		@book = Book.find_by!(slug: params[:book_id])
	end

	def review_params
		params.require(:review).permit(:comment, :stars)
	end
end
