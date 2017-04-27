require 'bcrypt'

# User Class
class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  validates :name, length: { minimum: 2 }
  validate :capitalize
  validates_uniqueness_of :name
  has_many :statuses, dependent: :destroy
  has_many :groups_users, dependent: :destroy
  has_many :groups, through: :groups_users

  def capitalize
    errors.add(:name, 'name is not capitalized') unless capitalize_condition?
  end

  def capitalize_condition?
    !name.nil? && !name.empty? && name[0] == name[0].upcase
  end

  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
