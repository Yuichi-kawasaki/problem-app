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
  { id: 10, name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' }
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
  { id: 16, user_id: 1, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') }
)

# Admin.create(
#         name:  '管理者',
#         email: 'admin@admin.com',
#         password:  '00000000',
#   )

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
