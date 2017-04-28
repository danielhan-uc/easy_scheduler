class Post < ActiveRecord::Base
  validates :title, :description, :address, :price, :startdate, :enddate, :owner, :phone, presence: true
  has_many :comments
end
