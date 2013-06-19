namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    type_ary = ["Artifact", "Troop", "Constant", "Quick Action", "Basic Action", "Resource"]
    color_ary = ["Colorless", "Blood", "Wild", "Diamond", "Ruby", "Sapphire"]
    rarity_ary = ["Legendary", "Rare", "Uncommon", "Common", "Token", "Promo"]
    trait_ary = ["Orc", "Zombie", "Elf", "Shin-hare"]
    faction_ary = ["Ardent", "Underworld", "Neutral"]
    Card.create!(name: "Infected Zombie",
                 cost: 3,
                 card_type: "Troop",
                 color: "Blood",
                 rarity: "Promo",
                 game_type: "PvE",
                 attack: 2,
                 defense: 2,
                 trait: "Zombie",
                 game_text: "When this troop deals fatal damage to a troop,",
                 lore_text: nil,
                 restriction: nil,
                 set_number: 1,
                 faction: "Ardent",
                 related_equipment: 1,
                 image: "infected_zombie.jpg")
    99.times do |n|
      name  = Faker::Name.name
      cost = rand(1..8)
      card_type = type_ary[rand(0..5)]
      color = color_ary[rand(0..5)]
      rarity = rarity_ary[rand(0..5)]
      trait = trait_ary[rand(0..3)]
      faction = faction_ary[rand(0..2)]
      lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      Card.create!(name: name,
                   cost: cost,
                   card_type: card_type,
                   color: color,
                   rarity: rarity,
                   game_type: rand(0..1),
                   attack: rand(0..8),
                   defense: rand(1..8),
                   trait: trait,
                   game_text: lorem,
                   lore_text: lorem,
                   restriction: "Unique",
                   set_number: 1,
                   faction: faction,
                   related_equipment: nil,
                   image: "example-#{n+1}.jpg")
    end
  end
end