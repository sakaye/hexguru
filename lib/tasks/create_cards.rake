namespace :db do
  desc "Fill database with card colors"
  task colors: :environment do
    color_ary = ["Artifact", "Blood", "Diamond", "Ruby", "Sapphire", "Wild"]
    color_ary.each do |t|
      Color.create(name: "#{t}")
    end
  end

  desc "Fill database with card types"
  task types: :environment do
    type_ary = ["Artifact", "Troop", "Constant", "Quick Action", "Basic Action", "Resource", "Champion"]
    type_ary.each do |t|
      Type.create(name: "#{t}")
    end
  end

  desc "Fill database with card rarities"
  task rarity: :environment do
    rarity_ary = ["Legendary", "Rare", "Uncommon", "Common", "Token", "Promo"]
    rarity_ary.each do |t|
      Rarity.create(name: "#{t}")
    end
  end

  desc "Fill database with card factions"
  task factions: :environment do
    faction_ary = ["Neutral", "Ardent", "Underworld"]
    faction_ary.each do |t|
      Faction.create(name: "#{t}")
    end
  end

  desc "Fill database with card traits"
  task traits: :environment do
    traits_ary = ["Coyotel", "Dwarf", "Elf", "Human", "Necrotic", "Orc", "Shin'Hare",
                  "Shroomkin", "Vennen", "Beast", "Dinosaur", "Plant", "Spirit",
                  "Bird", "Kraken", "Mutant", "Dragon", "Voidtouched", "Robot",
                  "Harpy", "Tiger", "Elemental", "Great Wolf", "Skeleton", "Rock Beast",
                  "Insect", "Gnoll", "Zombie", "Ranger", "Warrior", "Warlock",
                  "Mage", "Cleric", "Concubunny", "Rogue", "Witch", "King", "Elder",
                  "Princess", "Gladiator", "Troop", "Trainer", "High Cleric",
                  "Vampire", "Trap", "Shapeshifter", "Tentacle", "Ballistics Dwarf",
                  "Dream", "Avatar of Destruction", "Shrine", "Factory"]
    traits_ary.each do |t|
      Trait.create(name: "#{t}")
    end
  end

  desc "Fill database with card collections"
  task collections: :environment do
    collections_ary = ["Shards of Fate"]
    collections_ary.each do |t|
      Collection.create(name: "#{t}")
    end
  end

  desc "Fill database with card keywords"
  task keywords: :environment do
    keywords_ary = ["Crush", "Defensive", "Escalation", "Flight", "Inspire", "Invincible",
                    "Lifedrain", "Rage", "Speed", "Spellshield", "Steadfast", "Swiftstrike"]
    keywords_ary.each do |t|
      Keyword.create(name: "#{t}")
    end
  end

  desc "Fill database with all association card info"
  task :alldata => [:colors, :types, :rarity, :factions, :traits, :collections, :keywords]
end



