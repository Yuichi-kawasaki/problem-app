# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Problem.create!(
   [
     {
       title: 'クライオポンプ',
       limit_on: '2020-05-05',
       status: '着手中',
       priority: '中',
       user_id: users[1].id
     },
     {
       name: 'スパッタイオンポンプ',
       limit_on: '2020-06-06',
       status: '着手中',
       priority: '高',
       user_id: users[0].id
     },
     {
       name: '電離真空系',
       limit_on: '2020-07-07',
       status: '未着手',
       priority: '低',
       user_id: users[7].id
     },
     {
       name: 'ピラニ真空系',
       limit_on: '2020-08-08',
       status: '完了',
       priority: '中',
       user_id: users[5].id
     },
     {
       name: '蒸着装置',
       limit_on: '2020-09-09',
       status: '未着手',
       priority: '高',
       user_id: users[8].id
     },
     {
       name: 'スパッタ装置',
       limit_on: '2020-10-10',
       status: '着手中',
       priority: '高',
       user_id: users[0].id
     }
   ]
 )
