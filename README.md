## テーブル設計

#usersテーブル
|column|type|options|
|------|----|-------|
|email|string|not null,unique|
|encrypted_password|string|not null|
|name|string|not null|
|profile|text|not null|
|occupation|text|non null|
|position|text|not null|

#prototypesテーブル
|column|type|options|
|------|-----|-----|
|title|string|not null|
|catch_copy|text|not null|
|concept|text|not null|
|user|references|not null,foreign key|

#commentsテーブル
|column|type|options|
|------|-----|-----|
|content|text|not null|
|prototype|references|not null,foreign key|
|user|references|not null,foreign key|