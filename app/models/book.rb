class Book < ApplicationRecord
	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true
	validates :body,    length: { maximum: 200}

	def favorited_by?(user)
		self.favorites.where(user_id: user.id).exists?
	end

	def self.search(search, word)
    if search == "perfect_match"
      @books = Book.where("title LIKE?", "#{word}")
    elsif  search == "forward_match"
      @books =Book.where("title LIKE?", "%#{word}")
    elsif search == "backward_match"
      @books = Book.where("title LIKE?", "#{word}%")
    elsif search == "partial_match"
      @books = Book.where("title LIKE?", "%#{word}%")
    else
      @books = Book.all
    end
  end

end
