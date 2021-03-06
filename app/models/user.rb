class User < ApplicationRecord
	has_many :library_users, dependent: :destroy
	has_many :libraries, through: :library_users

	has_secure_password
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }


	def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

  def member? (library)
  	library.users.include?(self)
  end
end
