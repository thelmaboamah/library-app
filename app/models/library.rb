class Library < ApplicationRecord
	has_many :library_users, dependent: :destroy
	has_many :users, through: :library_users

	validates :name, presence: true, uniqueness: true, length: {maximum: 75}
	validates :floor_count, presence: true, :numericality => {:greater_than_or_equal_to => 0}
	validates :floor_area, presence: true, :numericality => {:greater_than_or_equal_to => 0}

	def member? (user)
		user.libraries.include?(self)
	end
end
