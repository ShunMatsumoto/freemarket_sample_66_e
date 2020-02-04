## ○概要
TECH::EXPERTの最終課題にて作成したアプリケーションを紹介します。また本資料では、自身で実装した箇所、および開発を通じて得られた経験についても紹介します。
某フリーマーケットアプリケーションのコピーサイトを作成しました。

## ○アプリケーション概要
接続先情報  
URL https://www.freemarket-sample-66-e.com/  
ID/Pass  
ID: admin  
Pass: 2222  
テスト用アカウント等  
購入者用  
メールアドレス: buyer@gmail.com  
ユーザー名:山田太郎（ニックネーム:タロちゃん）  
パスワード: buyer123  
購入用カード情報  
番号：4242424242424242  
期限：1/23  
セキュリティコード：123  
出品者用  
メールアドレス名: seller@gmail.com  
田中一郎（ニックネーム:いっちゃん）  
パスワード: seller123  
Githubリポジトリ  
https://github.com/ShunMatsumoto/freemarket_sample_66_e  

## ○開発環境
開発環境  
ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code  
開発チーム  
開発期間と平均作業時間  
開発期間：約4週間  
1日あたりの平均作業時間：約10時間  
開発体制  
人数：5名  
アジャイル型開発（スクラム）  
Trelloによるタスク管理  

## ○開発担当箇所

### 【DB設計】

### 【トップページ（フロントエンド）】
○https://github.com/ShunMatsumoto/freemarket_sample_66_e  
にアクセスするとご覧いただけます。
![screencapture-localhost-3000-2020-01-27-18_44_20](https://user-images.githubusercontent.com/58409647/73710513-8c47fe80-4747-11ea-92bd-287ffc32b9ac.png)

### 【ユーザー本人確認ページ】
○ログイン後、ヘッダー右側のマイページに入って頂き、サイドバーの中にあります「本人情報」よりご覧頂けます。
![screencapture-localhost-3000-items-person-check-2020-01-27-18_08_18](https://user-images.githubusercontent.com/58409647/73710632-e779f100-4747-11ea-8a33-17ebe43ba60a.png)

### 【ユーザー新規登録、ログイン（フロントエンド）】
新規会員登録を行う際に遷移していく画面の実装です。
![screencapture-localhost-3000-users-signup-registration-2020-01-27-18_11_08](https://user-images.githubusercontent.com/58409647/73711565-a46d4d00-474a-11ea-87de-9c936b2439e2.png)
![screencapture-localhost-3000-users-signup-sms-confirmation-2020-01-27-18_12_36](https://user-images.githubusercontent.com/58409647/73711581-afc07880-474a-11ea-977d-4ca4147e614c.png)
![screencapture-localhost-3000-addresses-new-2020-01-27-18_13_15](https://user-images.githubusercontent.com/58409647/73711610-bfd85800-474a-11ea-8ff0-ea34fb91dbb6.png)

### 【商品一覧ページ（バックエンド）】
・最新のアイテムから10件分のデータを表示できるように実装しました。  
・コントローラーに商品を紐付いた画像を含めて、新着順に10件の商品を持ってくるように記述しました。  
画像は一つの商品に付き10枚まで投稿出来る仕様になっているので、トップページでは1枚目を表示するように記述しています。価格と商品名を表示しています。

![screencapture-localhost-3000-2020-01-27-18_44_20](https://user-images.githubusercontent.com/58409647/73710513-8c47fe80-4747-11ea-92bd-287ffc32b9ac.png)

### 【パンくずリスト（バックエンド）】
・ヘッダーの下部にある、自分がWebサービス上のどこにいるのかを視覚的にわかるようにする機能です。  
・Ruby on Railsの”gretel”というgemを使用し、パンくず機能を追加しました。
<img width="1290" alt="スクリーンショット 2020-01-27 18 46 52" src="https://user-images.githubusercontent.com/58409647/73711768-43924480-474b-11ea-8ecb-ca123ad6f562.png">

### 【商品情報編集機能（バックエンド）】
・出品済の商品の内容を編集できる機能です。画像はプレビュー表示し、Javascriptで追加・削除ができます。
・保存されている画像をプレビュー表示させるために画像データをバイナリーデータに変換しました（本番環境ではAWSのS3を使用しているため、aws_sdkの記述もしています）。  
・コントローラーで定義した変数をJavascriptで使用するために、”gon”というgemをインストールし、定義しました。  
・Javascriptで既存の画像の配列、新しい画像の配列、その全てが入る配列を定義しました。  
・一つの商品に付き10枚まで画像を持たせる事が出来る使用になっており、5枚を一行で表示させるようにしました。  
・編集前の画像が4枚以下の時、5枚の時、6枚以上9枚以下の時、10枚の時で条件分岐を記述しました。  
・さらに、既存の画像が削除された時、新しい画像が追加された時、それぞれの事象が起きた時に画像が何枚なのかを上記と同じように条件分岐させました。  
・上記で行った編集をajaxのリクエストとしてupdateアクションへ送りました。  
・編集完了後、商品詳細ページへのredirectを記述しました。  
・ajaxからのリクエストではredirect_toが発動しませんでしたので、helperにajaxのredirectを記述し、該当のコントローラーへ読み込ませました。  
・この時に作成したjsファイルがあらゆるjsファイルに干渉していたので、edit.jsでしか使用していない変数”gon”がundefindedでなければ実行というif文で干渉を解決しました。  
![screencapture-localhost-3000-items-13-edit-2020-01-28-14_06_41](https://user-images.githubusercontent.com/58409647/73711830-7b998780-474b-11ea-9d7f-d69769a81c2c.png)


<!-- フリマアプリ「メルカリ」のクローンサイト -->
## usersテーブル
| Column     | Type  | Options          |
|----------------|---------|---------------------------|
| nickname    | string | null: false |
| email     | string | null: false, unique: true, index: true 
| password    | string | null: false        |
| first_name   | string | null: false        |
| last_name    | string | null: false        |
| first_name_kana | string | null: false        |
| last_name_kana | string | null: false        |
| birthday    | date  | null: false        |
| phone     | string | null: false, unique: true, index: true|
### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_one :card
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_one :address

## Addressesテーブル
| Column | Type | Options |
|--------|------|---------|
| user_id | integer | null: false,foreign_key:true |
| postal_code | integer | null: false |
| prefectures | string | null:false |
| municipality | string | null:false |
| street_number | string | null:false |
| building_name | string |            |
| first_name   | string | null: false        |
| last_name    | string | null: false        |
| first_name_kana | string | null: false        |
| last_name_kana | string | null: false        |
### Association
- belongs_to :user 

## itemsテーブル
| Column     | Type  | Options            |
|-----------------|---------|--------------------------------|
| name      | string | null: false, index: true    |
| price      | integer | null: false          |
| description   | text  | null: false          |
| condition     | integer | null: false          |
| location    | string | null: false          |
| delivery_charge | integer | null: false          |
| delivery_way | integer | null: false          |
| delivery_days | integer | null: false          |
| category_id | integer | null: false, foreign_key |
| saler_id | integer | null: false, foreign_key: true |
| buyer_id | integer | foreign_key: true |
| brand_id | integer | foreign_key: true |
### Association
- belongs_to :user
- has_many :comments
- has_many :likes
- belongs_to :brand
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :images
- belongs_to :category

## imagesテーブル
| Colimn | Type | Options |
|--------|------|---------|
| item_id | integer | foreign_key |
| name | string | null: false |
### Association
- belongs_to :item

## commentsテーブル
| Column | Type  | Options            |
|---------|---------|--------------------------------|
| comment | string | null: false          |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
## likesテーブル
| Column | Type  | Options            |
|---------|---------|--------------------------------|
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item

## Categorysテーブル
| Column | Type | Option |
|--------|------|--------|
| name | string | null:false |
| ancestry | string | index: true |
### Association
- has_many :items
- has_ancestry
## brandsテーブル
| Column | Type  | Options   |
|---------|---------|-------------|
| name  | string | null: false |
### Association
- has_many :items
## cardsテーブル
| Column | Type | Option |
|---------|-------|------|
| user_id | integer | null: false |
| customer_id | string | null: false |
| card_id | string | null: false |
| token   | string | null:false  |
### Asosiation
- belongs_to :user

