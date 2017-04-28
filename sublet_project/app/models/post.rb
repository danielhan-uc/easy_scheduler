class Post < ActiveRecord::Base
  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :picture, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  has_attached_file :picture, :default_url => "/empty.png"

  validates :title, :description, :address, :price, :startdate, :enddate, :owner, :phone, presence: true
  has_many :comments
end
