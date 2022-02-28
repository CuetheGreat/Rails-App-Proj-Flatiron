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

%w[Aarokocra Aasimar Bugbear Dragonborn Dwarf].each do |kind|
  race = Race.create(name: kind)
  case kind
  when 'Aarokocra'
    Benefit.create(name: 'Dexterity', value: 2, race_id: race.id)
    Benefit.create(name: 'Wisdom', value: 1, race_id: race.id)
  when 'Aasimar'
    Benefit.create(name: 'Wisdom', value: 1, race_id: race.id)
    Benefit.create(name: 'Charisma', value: 2, race_id: race.id)
  when 'Bugbear'
    Benefit.create(name: 'Dexterity', value: 1, race_id: race.id)
    Benefit.create(name: 'Strength', value: 2, race_id: race.id)
  when 'Dragonborn'
    Benefit.create(name: 'Strength', value: 2, race_id: race.id)
    Benefit.create(name: 'Charisma', value: 1, race_id: race.id)
  when 'Dwarf'
    Benefit.create(name: 'Constitution', value: 2, race_id: race.id)
    Benefit.create(name: 'Wisdom', value: 1, race_id: race.id)
  end
end

%w[Elf Firbolg Genasi Gnome Goblin Goliath].each do |kind|
  race = Race.create(name: kind)
  case kind
  when 'Elf'
    Benefit.create(name: 'Dexterity', value: 2, race_id: race.id)
    Benefit.create(name: 'Intelligence', value: 1, race_id: race.id)
  when 'Firbolg'
    Benefit.create(name: 'Strength', value: 1, race_id: race.id)
    Benefit.create(name: 'Wisdom', value: 2, race_id: race.id)
  when 'Genasi'
    Benefit.create(name: 'Constitution', value: 2, race_id: race.id)
    Benefit.create(name: 'Intelligence', value: 1, race_id: race.id)
  when 'Gnome'
    Benefit.create(name: 'Dexterity', value: 1, race_id: race.id)
    Benefit.create(name: 'Intelligence', value: 2, race_id: race.id)
  when 'Goblin'
    Benefit.create(name: 'Dexterity', value: 2, race_id: race.id)
    Benefit.create(name: 'Constitution', value: 1, race_id: race.id)
  when 'Goliath'
    Benefit.create(name: 'Strength', value: 2, race_id: race.id)
    Benefit.create(name: 'Constitution', value: 1, race_id: race.id)
  end
end

%w[BARBARIAN BARD CLERIC DRUID FIGHTER MONK PALADIN RANGER ROGUE SORCERER WARLOCK WIZARD].each do |job|
  Job.create(name: job)
end

['Supreme Kings', 'Underhill Dwellers'].each { |char| Party.create(name: char) }

['Ulben Balro',
 'Ricis Ravacyne',
 'Emelumin Kelmaer',
 'Niktelar Krisgeiros',
 'Nigenar Phiric'].each_with_index do |char, index|
  Character.create(name: char, user: User.find(index + 1), party: Party.find(1), race: Race.find(index + 1),
                   job: Job.find(index + 1))
end
['Arntar Ravayra',
 'Anlis Vaynore',
 'Urlan Genthana',
 'Elfinas Gretoris',
 'Fulano Phigied'].each_with_index do |char, index|
   Character.create(name: char, user: User.find(index + 1), party: Party.find(2), race: Race.find(index + 1),
                    job: Job.find(index + 1))
 end

Character.all.each do |chara|
  %w[Strength Dexterity Constitution Wisdom Charisma Intelligence].each do |ability|
    ab = Ability.create(name: ability, value: rand(8..18), character: chara)
    puts ab.errors.full_messages
  end
end
