class Product < ActiveRecord::Base
	has_many :items_in_carts

	before_destroy :ensure_not_located_in_any_cart
	validates :title, :description, length: {minimum: 5}
	validates :image_url, presence: true
	validates :title, uniqueness: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message:'must be URL for GIF, JPG or PNG image'
	}

	private
	def ensure_not_located_in_any_cart
		if items_in_carts.empty?
			return true
		else
			errors.add(:base, '#{title} present in shopping carts and or orders')
			return false
		end
	end
end
