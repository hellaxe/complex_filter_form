# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Chewy.strategy(:atomic)
league_names = %w(standard hardcore casual)
League.destroy_all
league_names.each do |l|
  League.create(name: l)
end

item_names = %w(sword gun staff wand knife dagger bow hammer axe club dildo)
mods = %w(fire wind monkey mark lsd steel midas speed heat water ice lightning summon)
rarities = %w(normal legendary magick rare uniq)
10_000.times do |time|
  item_name = item_names[rand(item_names.length - 1)]
  if time % 100 == 0
    puts time
  end
  item = Item.new(name: item_name, str: rand(10), dex: rand(10), int: rand(10),
                  rarity: rarities[rand(rarities.length - 1)], league: League.all.sample)
  item.apply_affix
  item.apply_prefix

  item.save

  rand(10).times do
    item.mods.create(name: mods[rand(mods.length - 1)], value: rand(100))
  end
end