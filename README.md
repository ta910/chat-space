# DB設計

--------------------------------
## usersテーブル
--------------------------------
### カラム
name string型
### アソエーション
has_many :messages  
has_many :group_users  
has_many :groups, through: :group_users

--------------------------------
## groupsテーブル
--------------------------------
### カラム
name string型
### アソエーション
has_many :messages  
has_many :group_users  
has_many :users, through: :group_users

--------------------------------
## group_usersテーブル
--------------------------------
### カラム
user_id reference型  
group_id reference型
### アソエーション
belongs_to :user  
belongs_to :group

---------------------------------
## messagesテーブル
---------------------------------
### カラム
body text型  
image string型  
user_id reference型  
group_id reference型
### アソエーション
belongs_to :user  
belongs_to :group
