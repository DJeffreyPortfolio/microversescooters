class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: {only_integer: true}

  Post.paginate(:page => params[:page], :per_page => 15)

  scope :rating_desc, ->{order(rating: :desc)}
end
