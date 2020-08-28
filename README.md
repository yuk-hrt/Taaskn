# Taaskn
<img src="https://github.com/yuk-hrt/Taaskn/blob/master/app/assets/images/logo.png" alt="taaskn" width="300" height="180"/>

## 概要
自分のタスクをシェアできます。
自分好みのタスクを作成していいねをもらいましょう。
## デプロイ先
https://taaskn.herokuapp.com/
## ベーシック認証
- ID: taaskn
- pass: 0702
## テストアカウント
- メールアドレス：　test@com
- パスワード：　00000000
## 仕様
- Ruby
- Ruby on Rails
- Bootstrap
- MySQL
- Heroku
## 主な機能
- ユーザー登録、ログイン、ログアウト
- リストの作成、編集、削除
- リストのいいね機能
- カードの作成、編集、削除
- カードをドラック＆ドロップで並び替え(スマホ対応)
- カードをドラック＆ドロップで完了BOXに移動(スマホ対応)
- レスポンシブデザイン(スマホサイズになると1列表示)
- ロゴは自身で作成
## 今後実装したい機能
- LINE BOTを用いてのタスク、カード作成
- LINEアカウントでのログイン
- いいねの通知(LINE)

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :lists
- has_many :likes

## listsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|like_count|integer||
|user_id|references|null: false|
### Association
- has_many :cards
- has_many :likes
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|memo|string|null: false|
|done|boolean|null: false|
|row_order|integer||
|list_id|references|null: false|
### Association
- belongs_to :list

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references||
|list_id|references||
### Association
- belongs_to :list
- belongs_to :user
