require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "product attributes can not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  end

  test "product price must not be negative" do
  	product = Product.new( title: "My Title",
  		description: "yyyxxx",
  		image_url: "image.jpg")
  	product.price = -1
  	assert product.invalid?
  	assert product.errors[:price]
  	assert ["must be greater than or equal to 0.01"], product.errors[:price]
  end

  test "product price must not be zero" do
  	product = Product.new( title: "My Title",
  		description: "yyyxxx",
  		image_url: "image.jpg")
  	product.price = 0
  	assert product.invalid?
  	assert product.errors[:price]
  	assert ["must be greater than or equal to 0.01"], product.errors[:price]
  end

  test "product price must greater than 0.01" do
  	product = Product.new( title: "My Title",
  		description: "yyyxxx",
  		image_url: "image.jpg")
  	product.price = 1
  	assert product.valid?
  end

  def new_product(image_url)
  	Product.new(title: "My Title",
  		description: "xxxyyy",
  		price: 1,
  		image_url: image_url)
  end

  test " ok image url" do 
  	ok =  ["vape.gif","vape.jpg", "vape.png", "VAPE.JPG", "vape.JpG", "http://a.c.s./x/e/vape.gif"]

  	ok.each do |name|
  		assert new_product(name).valid?, "#{name} should be valid?"
  	end

  end

  test "bad image url" do 
  	bad =  ["vape.doc","vape.jgp", "vape.png/mo", "VAPE.pdf", "vape.docx", "http://a.c.s./x/e/vape_me"]
  	bad.each do |name|
  		assert new_product(name).invalid?, "#{name} should be invalid?"
  	end

  end

  test "product is not valid withour a unique title" do
  	product = Product.new(title: products(:three).title,
  		description: "xxxyyy",
  		price: 1,
  		image_url: "vape.gif")
  	assert product.invalid?
  	assert ["has already been taken"] , product.errors[:title]
  end

end
