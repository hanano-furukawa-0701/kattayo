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
<img width="1436" alt="スクリーンショット 2021-02-05 19 50 18" src="https://user-images.githubusercontent.com/65842692/107033261-62ad3180-67f8-11eb-8339-4d006d67a0b8.png">

### ・支出管理
月間の支出予算を登録し、現時点での支出金額と残りいくら使えるのかをアナウンスします。
<img width="1435" alt="スクリーンショット 2021-02-05 20 04 09" src="https://user-images.githubusercontent.com/65842692/107033451-abfd8100-67f8-11eb-9705-f2a3907d3508.png">

### ・カテゴリー、購入品登録
購入品のカテゴリーと購入品そのものを登録します。
<img width="1434" alt="スクリーンショット 2021-02-05 19 53 11" src="https://user-images.githubusercontent.com/65842692/107033895-48c01e80-67f9-11eb-81bb-309d5be61de8.png">
<img width="1438" alt="スクリーンショット 2021-02-05 19 54 54" src="https://user-images.githubusercontent.com/65842692/107033928-58d7fe00-67f9-11eb-8a89-f377b7a755b9.png">

### ・購入品管理
カテゴリーごとに購入品を記録します。また、支出金額を管理します。
<img width="1436" alt="スクリーンショット 2021-02-05 20 04 34" src="https://user-images.githubusercontent.com/65842692/107033507-bddf2400-67f8-11eb-9e8e-0f9f4e8c377c.png">


### ・登録情報編集
カテゴリーおよび購入品は編集・削除が可能です。月間支出予算も変更できます。
<img width="1436" alt="スクリーンショット 2021-02-05 20 12 48" src="https://user-images.githubusercontent.com/65842692/107033603-e535f100-67f8-11eb-9f86-78a2839ccdd7.png">


### ・購入品検索
購入品は検索が可能です。購入したかどうかを始め、いついくらで買ったかすぐに調べることができます。カテゴリーごとでも検索が可能です。
<img width="1436" alt="スクリーンショット 2021-02-05 20 11 30" src="https://user-images.githubusercontent.com/65842692/107033688-026abf80-67f9-11eb-85c0-11f606a7a5db.png">

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













