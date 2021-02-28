User.seed(
  :id,
  { id: 1,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  { id: 2,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  { id: 3,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  { id: 4,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  { id: 5,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  { id: 6,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  { id: 7,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  { id: 8,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  { id: 9,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  id: 10, name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password'
)

Problem.seed(
  :id,
  { id: 1, user_id: 1, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 2, user_id: 3, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 3, user_id: 3, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 4, user_id: 4, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 5, user_id: 1, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 6, user_id: 5, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 7, user_id: 6, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 8, user_id: 7, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 9, user_id: 2, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 10, user_id: 8, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 11, user_id: 1, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 12, user_id: 7, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 13, user_id: 10, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 14, user_id: 2, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  { id: 15, user_id: 2, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  id: 16, user_id: 1, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug')
)



#
#
#
# Users.create!(
#     [
#       {
#         image: File.open("./app/assets/images/default.png"),
#         name: 'テスト',
#         email: 'test@test.com',
#         password: '11111111',
#         gender: "1",
#         prefecture: "北海道",
#         city: "札幌",
#         profession: "運輸業",
#         occupation: "営業",
#         profile: "登録してみました。"
#       },
#       {
#         email: "admin@admin.com",
#         name:  "管理者",
#         password:  "00000000",
#         admin: true
#       },
#       {
#         image: File.open("./app/assets/images/default.png"),
#         name: 'テスト2',
#         email: 'test2@test2.com',
#         password: '22222222',
#         gender: "2",
#         prefecture: "大阪",
#         city: "大阪",
#         profession: "サービス業",
#         occupation: "経理",
#         profile: "がんばります"
#       },
#       {
#         image: File.open("./app/assets/images/default.png"),
#         name: 'テスト3',
#         email: 'test3@test3.com',
#         password: '33333333',
#         gender: "1",
#         prefecture: "神奈川",
#         city: "横浜",
#         profession: "IT",
#         occupation: "エンジニア",
#         profile: "趣味はサッカーです"
#       }
#     ]
#   )
#
  Label.create(title:'新規' )
  Label.create(title:'リピート' )
  Label.create(title:'IT関連' )
  Label.create(title:'使わなくなった物がある' )
  Label.create(title:'欲しいものがある' )
  Label.create(title:'近所トラブル' )
  Label.create(title:'職場トラブル' )
  Label.create(title:'買い物トラブル' )
  Label.create(title:'コロナ関連' )
  Label.create(title:'趣味関連' )
#
#
#   Problem.create!(
#     [
#       {
#         title: 'ドライポンプ',
#         image: File.open("./app/assets/images/noimage.png"),
#         content: '壊れた',
#         user_id: users[0].id
#       },
#       {
#         title: 'ターボ分子ポンプ',
#         image: File.open("./app/assets/images/noimage.png"),
#         content: '壊れた',
#         user_id: users[1].id
#       },
#       {
#         title: '油回転真空ポンプ',
#         image: File.open("./app/assets/images/noimage.png"),
#         content: '壊れた',
#         user_id: users[2].id
#       },
#       {
#         title: 'メカニカルプースターポンプ',
#         image: File.open("./app/assets/images/noimage.png"),
#         content: '壊れた',
#         user_id: users[3].id
#       }
#     ]
#   )
