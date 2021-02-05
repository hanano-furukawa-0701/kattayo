# Kattayo!
購入品管理アプリです。カテゴリーごとで購入品を記録できる他、月間支出金額を管理します。
"Kattayo!"で"買ったよ！"を管理します。

## Reason
既に買ったものを間違えて買ってしまい、無駄な出費をしてしまうと話す友人に向けて作成しました。
購入品を記録することで、既に買ったものを不必要に購入してしまうことを防ぎます。また、家計簿として現時点での支出金額を管理することも可能にし、無駄な出費を減らします。

## Dependency
・haml&Sass
・jQuery
・Ruby 
・Ruby on Rails
・MySQL
・Heroku

## Test account
メールアドレス：test_san@gmail.com
パスワード：test333

## Description
### ・ログイン
ユーザーは会員登録・ログインをすることで本アプリケーションを使用することができます。


### ・支出管理
月間の支出予算を登録し、現時点での支出金額と残りいくら使えるのかをアナウンスします。

### ・購入品管理
カテゴリーごとに購入品を記録します。カテゴリーは自分自身で登録でき、カテゴリーごとでも支出金額を管理します。

### ・登録情報編集
カテゴリーおよび購入品は編集・削除が可能です。もちろん月間支出予算も変更できます。

### ・購入品検索
購入品は検索が可能です。購入したかどうかを始め、いついくらで買ったかすぐに調べることができます。カテゴリーごとでも検索が可能です。

## App URL
https://kattayo.herokuapp.com/

## Database
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false,unique,index:true|
|password|string|null: false|
### Association
- has_one :target_amount, dependent: :destroy
- has_many :categories, dependent: :destroy
- has_many :items, dependent: :destroy

### target_amountsテーブル
|Column|Type|Options|
|------|----|-------|
|price|integer|null: false|
|user_id|references|null: false, foreign_key:true|
### Association
- belongs_to :user

### categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|target_amount|integer|null: false|
|user_id|references|null: false, foreign_key:true|
### Association
- belongs_to :user
- has_many :items, dependent: :destroy

### itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|text|text|
|user_id|references|null: false, foreign_key:true|
|category_id|references|null: false, foreign_key:true|
### Association
- belongs_to :user
- belongs_to :category













