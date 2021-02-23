User.create!(
    [
      {
        image: File.open("./app/assets/images/default.png"),
        name: 'テスト',
        email: 'test@test.com',
        password: '11111111',
        gender: "1",
        prefecture: "北海道",
        city: "札幌",
        profession: "運輸業",
        occupation: "営業",
        profile: "登録してみました。"
      },
      {
        email: "admin@admin.com",
        name:  "管理者",
        password:  "00000000",
        admin: true
      },
      {
        image: File.open("./app/assets/images/default.png"),
        name: 'テスト2',
        email: 'test2@test2.com',
        password: '22222222',
        gender: "2",
        prefecture: "大阪",
        city: "大阪",
        profession: "サービス業",
        occupation: "経理",
        profile: "がんばります"
      },
      {
        image: File.open("./app/assets/images/default.png"),
        name: 'テスト3',
        email: 'test3@test3.com',
        password: '33333333',
        gender: "1",
        prefecture: "神奈川",
        city: "横浜",
        profession: "IT",
        occupation: "エンジニア",
        profile: "趣味はサッカーです"
      }
    ]
  )

  # Label.create(title:'新規' )
  # Label.create(title:'リピート' )
  # Label.create(title:'修理' )
  # Label.create(title:'返品' )
  # Label.create(title:'追加' )
  # Label.create(title:'部品' )
  # Label.create(title:'転送' )
  # Label.create(title:'値引' )
  # Label.create(title:'現地確認' )
  # Label.create(title:'危険物' )


  Problem.create!(
    [
      {
        title: 'ドライポンプ',
        image: File.open("./app/assets/images/noimage.png"),
        content: '壊れた',
        user_id: users[0].id
      },
      {
        title: 'ターボ分子ポンプ',
        image: File.open("./app/assets/images/noimage.png"),
        content: '壊れた',
        user_id: users[1].id
      },
      {
        title: '油回転真空ポンプ',
        image: File.open("./app/assets/images/noimage.png"),
        content: '壊れた',
        user_id: users[2].id
      },
      {
        title: 'メカニカルプースターポンプ',
        image: File.open("./app/assets/images/noimage.png"),
        content: '壊れた',
        user_id: users[3].id
      }
    ]
  )
