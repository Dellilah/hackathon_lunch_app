# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
skills_list = [
	"Accounting",
	"Advertising",
	"Agile",
	"Auditing",
	"Automotive",
	"Banking",
	"Blogging",
	"Branding",
	"Budgeting",
	"Communication",
	"Databases",
	"Elearning",
	"Ecommerce",
	"Energy",
	"Engineering",
	"Entrepreneurship",
	"Fashion",
	"Financial",
	"Fundraising",
	"Graphics",
	"Healthcare",
	"Insurance",
	"Investments",
	"Leadership",
	"Loans",
	"Marketing",
	"Negotiation",
	"Sales",
	"Strategy"
]


skills_list.each do |name|
  Ability.create( name: name ) unless Ability.find_by_name(name)
end
