class Comment < ActiveRecord::Base
  validates :author, :description, presence: true
  belongs_to :post
end
