# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'algoliasearch'

Algolia.init(application_id: 'L2P2Y6H5NN',
             api_key:        '35ccb086d2dbd7e67e205541bd8360c5')
index = Algolia::Index.new('grubhub')

hits = []
index.browse({ query: '' }) do |hit|
  hits << hit
end

hits.each do |hit|
  dish = Dish.new(hit.except('_geoloc'))
  dish.save
end
