User.create!(
  [
    {
      name: 'テスト太郎',
      email: 'xxx@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      name: 'テスト徹子',
      email: 'yyy@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      name: 'テスト一郎',
      email: 'zzz@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      name: 'テスト二郎',
      email: 'aaa@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      name: 'テストNICORAS',
      email: 'bbb@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      name: 'テスト一子',
      email: 'ccc@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      name: 'テスト三郎',
      email: 'ddd@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      name: 'テストJACK',
      email: 'eee@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      name: 'テスト四郎',
      email: 'fff@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    },
    {
      name: 'テスト和子',
      email: 'mmm@testtest.com',
      password: '123456',
      password_confirmation: '123456',
    }
  ]
)
Label.create(title:'新規' )
Label.create(title:'リピート' )
Label.create(title:'IT関連' )
Label.create(title:'近所トラブル' )
Label.create(title:'職場トラブル' )
Label.create(title:'買い物トラブル' )
Label.create(title:'コロナ関連' )
Label.create(title:'趣味関連' )
Label.create(title:'その他' )

Problem.create!(
    [
      {
        title: '勉強方法について困っております',
        content: '現在、大学2年生なのですが、大学の学業と将来のための勉強をやらなくてはいけなく、効率的な勉強方法について模索しています。',
        user_id: 1,
      },
      {
        title: 'コロナ禍でのストレス解消方法について',
        content: 'コロナ禍で外出ができなくなり、余暇の楽しみが動画鑑賞メインとなってます。何か他にも趣味を探したいのですが、何かおすすめはありますか？',
        user_id: 2,
      },
      {
        title: 'おすすめのプログラミングスクール',
        content: 'プログラミングスクールに入校することを考えています。web系自社開発企業に転職するためには、どちらのプログラミングスクールが良いでしょうか？',
        user_id: 3,
      },
      {
        title: '近所の騒音で困っています',
        content: '都内のあるアパートの1階に住んでいるのですが、夜寝る時間に外で騒ぐ人がいて困っております。引っ越すにしても金銭面に余裕がなくできません。他に何か方法はありますでしょうか？',
        user_id: 4,
      },
      {
        title: 'おすすめの引越先',
        content: 'コロナ禍で東京離れが進んでいるので、東京から離れた場所に引っ越しを考えています。どこかおすすめの引っ越し先はありますか？',
        user_id: 5,
      },
      {
        title: '日商簿記３級のおすすめのテキストについて',
        content: '今年中に日商簿記３級を受験しようと考えています。イラストなどの解説がわかりやすい、おすすめのテキストを探してます。',
        user_id: 6,
      },
      {
        title: '職場のパワハラについて',
        content: '製造業の現場作業員をしています。職場に手を出すようなパワハラをする先輩がおり大変困っています。職場の責任者に言っても改善されず、
        どこかの外部組織に相談しないと解決できないと考えてます。解決できるような外部機関をご存知の方がいらっしゃいましたら、教えていただけると幸いです。',
        user_id: 7,
      },
      {
        title: '買ったものが不良品だった',
        content: '昨日買ったドライヤーが不良品でした。メーカーに確認したら、購入店に確認してと言われ、購入店に確認したら、メーカーに確認してと言われました。この場合、どのような対処方法がありますか？',
        user_id: 8,
      },
      {
        title: '東京近郊のおすすめの登山先',
        content: '近日中に、近場で登山を考えています。どこかおすすめの登山先はありますか？',
        user_id: 9,
      },
      {
        title: 'バスケができる場所について',
        content: '新宿近辺でバスケができる場所を探しています。おすすめの場所はありますか？',
        user_id: 10,
      }
    ]
  )


  #
  # User.seed(
  #   :id,
  #   { id: 1,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  #   { id: 2,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  #   { id: 3,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  #   { id: 4,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  #   { id: 5,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  #   { id: 6,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  #   { id: 7,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  #   { id: 8,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  #   { id: 9,  name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' },
  #   { id: 10, name: Faker::Games::Pokemon.name, email: Faker::Internet.email, password: 'password' }
  # )
  #
  # Problem.seed(
  #   :id,
  #   { id: 1, user_id: 1, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  #   { id: 2, user_id: 3, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  #   { id: 3, user_id: 3, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  #   { id: 4, user_id: 4, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  #   { id: 5, user_id: 10, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  #   { id: 6, user_id: 5, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  #   { id: 7, user_id: 6, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  #   { id: 8, user_id: 7, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  #   { id: 9, user_id: 8, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') },
  #   { id: 10, user_id: 9, title: Faker::Book.title, content: Faker::Markdown.random, image: Faker::Avatar.image('my-own-slug') }
  # )

  # Admin.create(
  #         name:  '管理者',
  #         email: 'admin@admin.com',
  #         password:  '00000000',
  #   )
