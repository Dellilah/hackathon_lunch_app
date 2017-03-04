# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
skills_list = ["Agile", "SCRUM", "Accounting", "Opensource"]

skills_list.each do |name|
  Ability.create( name: name ) unless Ability.find_by_name(name)
end
