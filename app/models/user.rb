class User < ActiveRecord::Base
	after_destroy :ensure_an_admin
	validates :name, presence: true, uniqueness: true

	has_secure_password

	private

	def ensure_an_admin
		if User.count <= 1
			raise "can't delete user, due to minimum user limit. "
		end
	end
end
