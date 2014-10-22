# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Demand.destroy_all

User.create([{ name: 'Baozi Wu', email: 'baozi.rails@gmail.com', password: 'vvvvvv' },
 { name: 'Paotzu'  , email: 'paotzu.wu@gmail.com'  , password: 'vvvvvv' }
 ])


moment = %w[早 午 晚]
week   = %w[日 一 二 三 四 五 六]

moment.each do |moment|
  week.each do |week|
    name = week + moment
    WeekTime.create(name: name)
  end
end