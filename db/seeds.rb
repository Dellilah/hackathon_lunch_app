# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
skills_list = [
	"Account management"
	"Accounting"
	"Advertising"
	"Agile Metodologies"
	"Analytical Skills"
	"Art direction"
	"Auditing"
	"Automotive"
	"Banking"
	"Blogging"
	"Brand Development"
	"Brand Management"
	"Budgeting"
	"Business Analysis"
	"Business Development"
	"Business intelligence"
	"Business Process Improvement"
	"Business Strategy"
	"Communication"
	"Construction Management"
	"Customer Satisfaction"
	"Data Analysis"
	"Databases"
	"Digital Media"
	"Direct Sales"
	"E-learning"
	"Ecommerce"
	"Employee Relations"
	"Employee Training"
	"Energy"
	"Engineering"
	"Entrepreneurship"
	"Event management"
	"Event Planning"
	"Fashion"
	"Financial Accounting"
	"Financial Analysis"
	"Financial Modeling"
	"Financial Risk"
	"Fundraising"
	"Graphics"
	"Healthcare"
	"Hotel management"
	"Human resources"
	"Insurance"
	"Investments"
	"IT management"
	"Leadership"
	"Leadership Development"
	"Legal writing"
	"Loans"
	"Management Consulting"
	"Marketing"
	"Marketing Strategy"
	"Negotiation"
	"Network Administration"
	"Office Administration"
	"Organizational Development"
	"Product Development"
	"Project Management"
	"Real Estate"
	"Retail Banking"
	"Small Business"
	"Software Development"
	"Supply Chain Management"
	"Team building"
	"Web Development"
]






skills_list.each do |name|
  Ability.create( name: name ) unless Ability.find_by_name(name)
end
