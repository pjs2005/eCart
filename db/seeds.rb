# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create!(
	title: 'The Milkman E-Liquid',
  description: %{<p>The Milkman e-liquid. Imagine a warm, toasted fruit tart.</p>
   <p>Now throw that in the blender with some vanilla bean ice cream and milk.</p>
   <p>That's the Milkman. A toasted fruit tart milkshake.</p>},
  image_url: 'the-milkman.jpg',
  price: 19.99
)

Product.create!(
	title: 'The Milkman - Churrios',
  description: %{<p>With the bar set incredibly high, 'Churrios' is the new flavour from The Milkman E-Liquids,
   and it will not disappoint.</p>
   <p>Churrios is fluffy churros with ice cold milk, how does that sound?</p>},
  image_url: 'churrios-milkman.jpg',
  price: 19.99
)

Product.create!(
	title: 'Pebbles Donut by Donuts E-Juice',
  description: %{<p>Introducing the new flavour from D'oh Nuts E-Juice.</p>
  <p>Sure to follow in the footsteps of the ever popular 'D'oh Nuts', Pebble's Donut is a fresh glazed donut,
   sprinkled with fruity pebbles and then dunked in a delicious glass of milk. Delicious!</p>},
  image_url: 'pebbles-donut.jpg',
  price: 19.99
)