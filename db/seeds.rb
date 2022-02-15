# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

%w[Brandon Cameron Kyle Toni Clayon].each do |user|
  User.create(name: user, username: "user#{user.downcase}", password: 'password')
end

%w[Aarokocra Ansimar Bugbear Dragonborn Dwarf Elf Firbolg Genasi Gnome Goblin Goliath].each do |name|
  Race.create(name:)
end

%w[BARBARIAN BARD CLERIC DRUID FIGHTER MONK PALADIN RANGER ROGUE SORCERER WARLOCK WIZARD].each do |name|
  Job.create(name:)
end

%w['Supreme Kings','Underhill Dwellers'].each { |char| Party.create(name: char) }

['Ulben Balro',
 'Ricis Ravacyne',
 'Emelumin Kelmaer',
 'Niktelar Krisgeiros',
 'Nigenar Phiric'].each_with_index do |char, index|
  chara = Character.create(name: char, user: User.find(index + 1), party: Party.find(1), race: Race.find(index + 1),
                           job: Job.find(index + 1))
end
['Arntar Ravayra',
 'Anlis Vaynore',
 'Urlan Genthana',
 'Elfinas Gretoris',
 'Fulano Phigied'].each_with_index do |char, index|
   chara = Character.create(name: char, user: User.find(index + 1), party: Party.find(2), race: Race.find(index + 1),
                            job: Job.find(index + 1))
 end

Character.all.each do |chara|
  %w[Strength Dexterity Constitution Wisdom Charisma Inteligence].each do |ability|
    ab = Ability.create(name: ability, value: rand(8..18), character: chara)
    puts ab.errors.full_messages
  end
end
