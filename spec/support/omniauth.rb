# テスト用にモックを使うための設定
# '/auth/provider'へのリクエストが、即座に'/auth/provider/callback'にリダイレクトされる
OmniAuth.config.test_mode = true

# Facebook用のモック
# '/auth/provider/callback'にリダイレクトされた時に渡されるデータを生成
OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
  provider: 'facebook',
  uid: '12345',
  info: { email: 'test1@example.com' },
  credentials: { token: '1234qwer' }
)
