# DB設計

## userテーブル
--------------------------------
### カラム
name string型
### アソエーション
has_many :messages
has_many :group_users
has_many :groups, through: :group_users

## groupテーブル
--------------------------------
### カラム
name string型
### アソエーション
has_many :messages
has_many :group_users
has_many :users, through: :group_users

## group_userテーブル
--------------------------------
### カラム
user_id integer型
group_id integer型
### アソエーション
belongs_to :user
belongs_to :group

## messageテーブル
---------------------------------
### カラム
body text型
image string型
user_id integer型
group_id integer型
### アソエーション
belongs_to :user
belongs_to :group
