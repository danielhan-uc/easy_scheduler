class Status < ActiveRecord::Base
  validates :text, length: { minimum: 5 }, presence: true
  belongs_to :user, class_name: 'User'
end
