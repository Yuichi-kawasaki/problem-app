# README

『カタログ設計』
# 製品名：困りごとサイト
製品概要：皆さんのお困りごとを解決します。
		困りごと・解決したいことを全国の皆さんに
		解決してもらいましょう！

# 諸条件
言語:Ruby,JavaScript
フレームワーク:Ruby on Rails
DB:PostgreSQL

インフラ:AWS(EC2x2,ELB,S3,RDS)
EC2①:ap-northeast-1a
EC2②:ap-northeast-1c
RDS: PostgreSQL

※インフラ面については、EC2インスタンスを二つ用意し、片方のダウンに対応できるようにした。

# 機能一覧/機能説明
1,マッチング機能
 ・優先度：高
    @困りごとを投稿することにより、その困りごとを見た解決できる人が
		コメントします。
＃フォロー機能/就業Term

2,メッセージ機能
 ・優先度：中
    @投稿した方とメッセージ交換ができます。
＃メッセージ機能/就業Term

3,リアクション機能
 ・優先度：中
    @投稿に対しリアクションができます。

4,投稿機能（写真付き）
 ・優先度：中
    @困りごとを投稿できます。

5,facebookやtwitterのログイン情報でログインできる
 ・優先度：高
＃API keyの取得実装、Facebook, twitter/カリキュラム外のWebAPI使用
＃deviseの使用/就業Term

6,動画を投稿できる
 ・優先度：低

７,AWSの実装
 ・優先度：中
   @冗長化とSSL認証化を含める。
＃AWS/就業Term

8,ラベル機能
 ・優先度：中
 ＃ラベルの使用/就業Term

9,ユーザー登録機能
 ・優先度：高
 ＃deviseの使用/就業Term


# 各バージョン
Ruby 2.6.5 /Rails 5.2.4.5 /Postgresql 13.1

# カタログ設計/機能一覧/テーブル定義書/ER図/画面遷移図
https://docs.google.com/spreadsheets/d/1gJmec3Ryt621tyKXP9LdVCzR1xiO8dUcIfa_ivIs00c/edit#gid=1556774610

# ワイヤーフレーム
https://drive.google.com/drive/folders/1_VrbTtQltm5SSAot3PMPScKVvD4rJGGs?usp=sharing

# 使用予定Gem
carrierwave
/mini_magick
/devise
/rails-i18n
/omniauth
/omniauth-twitter
/omniauth-facebook
/bootstrap
/carrierwave
/mini_magick
/faker
/seed-fu', '~> 2.3'
/kaminari'
/database_cleaner
/rails_admin
/rails_admin-i18n
/cancancan
/jquery-rails
