# テスト用にモックを使うための設定
# '/auth/provider'へのリクエストが、即座に'/auth/provider/callback'にリダイレクトされる
module OmniauthMacros
 def facebook_mock

    # Facebook用のモック
    # '/auth/provider/callback'にリダイレクトされた時に渡されるデータを生成
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        provider: 'facebook',
        uid: '12345',
        info: {
          name: 'mockuser',
          email: 'sample@test.com'
        },
        credentials: {
          token: 'hogefuga'
        }
      }
    )
  end
    def facebook_invalid_mock
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentails
    end
end
