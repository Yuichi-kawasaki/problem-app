# 製品名：困りごとアプリ Problem-app　
困りごとを持つ人々・解決できる人々をマッチングするアプリです。
困りごと・解決したいことを全国の皆さんに解決してもらいましょう！

# 構成図(AWSの製作物については消去済み)
![Untitled](https://user-images.githubusercontent.com/63999565/118431793-18e6b800-b712-11eb-98bb-f6ef0d408877.png)

# URL
https://floating-ravine-67011.herokuapp.com

# 制作時期
2021/2月ー3月

# 諸条件
サーバーサイド言語: Ruby

フレームワーク: Ruby on Rails

DB: PostgreSQL

インフラ:heroku
、AWS(EC2x2,ELB,S3,RDS)※消去済み

※インフラ面については、EC2インスタンスを二つ用意し、片方のダウンに対応できるようにした。

# 各バージョン
Ruby 2.6.5 /Rails 5.2.4.5 /Postgresql 13.1

# 機能一覧/機能説明
1. 認証機能(deviseの使用)
- ログイン / ユーザ登録 / パスワード再設定 / 管理者権限

2. 投稿機能
- 困りごとを写真付きで投稿できる機能

3. メッセージ機能
- 困りごとを投稿したユーザーとのダイレクトメッセージ機能

4. リアクション機能
- 他ユーザーの投稿に対し "解決できるかも！"のリアクション機能

5. コメント機能
- 他ユーザーの困りごと投稿に対してのコメント機能

6. フォロー機能
- 他ユーザーをフォローできる機能

7. facebookやtwitterでのログイン認証
- facebookやtwitterのログイン情報でログインができる機能

8. ラベル機能
- 困りごと投稿時にラベル（タグ）を選ぶことができる機能

# 画面偏移図 / テーブル定義
https://docs.google.com/spreadsheets/d/1gJmec3Ryt621tyKXP9LdVCzR1xiO8dUcIfa_ivIs00c/edit#gid=341823813

# ワイヤーフレーム / ER図
https://drive.google.com/drive/folders/1_VrbTtQltm5SSAot3PMPScKVvD4rJGGs?usp=sharing

# 使用Gem
carrierwave
/ devise
/ rails-i18n
/ omniauth
/ omniauth-twitter
/ omniauth-facebook
/ bootstrap
/ carrierwave
/ mini_magick
/ faker
/ seed-fu', '~> 2.3'
/ kaminari'
/ database_cleaner
/ rails_admin
/ rails_admin-i18n
/ cancancan
/ jquery-rails
/ font-awesome-rails
