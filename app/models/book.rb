class Book < ApplicationRecord
	before_validation :generate_slug

	validates :slug, uniqueness: true
	validates :title, presence: true, uniqueness: true

	has_many :reviews, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :users, through: :likes
	has_many :likers, through: :likes, source: :user
	has_many :categorizations, dependent: :destroy
	has_many :categories, through: :categorizations

	scope :past, -> { where('released_on < ?', Time.now).order(:released_on) }
	scope :upcoming, -> { where('released_on >= ?', Time.now).order(:released_on) }
	scope :free, -> { upcoming.where(price: 0).order(:title) }
	scope :recent, ->(max=3) { past.limit(max) }

	#def self.past
	#	where('released_on < ?', Time.now).order(:released_on)
	#end

	#def self.free
	#	where(price: 0).order(:released_on)
	#end

	#def self.upcoming
	#	where('released_on >= ?', Time.now).order(:released_on)
	#end

	def free?
		price.blank? || price.zero?
	end

	def total_review_stars
		stars = 0
		if reviews.any?
			reviews.each do |review|
				stars += review.stars
			end
		end
		stars
	end

	def average_review_stars
		review_stars = 0
		if reviews.any?
			review_stars = total_review_stars / reviews.size
		end
		review_stars
	end

	def to_param
		slug
	end

	def generate_slug
		self.slug ||= title.parameterize if title
	end
end
