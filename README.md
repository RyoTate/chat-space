# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#chatspaceの機能
+ １対１のチャット機能
+ 新規登録機能
+ 複数人によるグループチャット
+ 友達検索機能
+ chatsoaceユーザーの検索機能
+ チャットグループへのユーザー追加機能
+ チャットの履歴表示機能
+ 画像送信機能
+ チャットの自動更新

#chatspaceデータベース設計書

##用語
+ not null => not null制約
+ unique => 一意性制約
+ add_index => インデックスを貼る
+ foreign_key => 外部キー制約


###messages
+ |column name| type  |option     |
+ |:----------|------:|:---------:|
+ |body       |text   |index      |
+ |image      |string |           |
+ |group_id   |integer|foreign_key|
+ |user_id    |integer|foreign_key|

####リレーション
+ belongs_to :users_groups
+ belongs_to :users


###users

+ |column name| type    |option        |
+ |:----------|--------:|:------------:|
+ |name       |string   |not null,index|
+ |email      |text     |              |
+ |password   |string   |not null      |

####リレーション
+ has_many :users_groups
+ has_many :groups, through: :users_groups

###groups
+
+ |column|type  |option  |
+ |:-----|-----:|:------:|
+ |name  |string|not null|

####リレーション
+has_many :users_groups
+has_many :users, through: :users_groups

###users_groups
+
+|column |type       |option               |
+|:------|----------:|:-------------------:|
+|user_id|references |not null, foreign_key|
+|group_id|references|not null, foreign_key|

####リレーション
+belongs_to :user
+belongs_to :group



