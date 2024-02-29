*Userテーブル*
|column              |Type       |Options    |
|--------------------|-----------|-----------|
|nickname            |string     |null: false|
|mail                |string     |null: false, unique: true|
|encrypted_password  |string     |null: false|
|last_name           |string     |null: false|
|first_name          |string     |null: false|
|last_name_kana      |string     |null: false|
|first_name_kana     |string     |null: false|
|birthday            |date       |null: false|


###Association
-has_many :items
-has_many  :purchase_histories


*itemsテーブル*
|column           |Type       |Options    |
|-----------------|-----------|-----------|
|price            |integer    |null: false|
|name             |string     |null: false|
|description      |text       |null: false|
|category_id      |integer    |null: false|
|spec_id          |integer    |null: false|
|shipping_fee_id  |integer    |null: false|
|pref_id          |integer    |null: false|
|shipping_day_id  |integer    |null: false|
|benefit          |integer    |null: false|
|user             |reference  |null:false, foreign_key: true|

-belongs_to :user
-has_one :purchase_history


*purchase_historyテーブル*
|column           |Type       |Options    |
|-----------------|-----------|-----------|
|user             |references |null: false, foreign_key: true|
|item             |references |null: false, foreign_key: true|

###Association
-has_one :shipping_address
-belongs_to :item
-belongs_to :user

*shipping_address*
|column           |Type       |Options    |
|-----------------|-----------|-----------|
|post_number      |string     |null: false|
|pref_id          |integer    |null: false|
|city             |string     |null: false|
|street_address   |string     |null: false|
|building         |string     |           |
|telephone_number |siring     |null: false|
|purchase_history |references|null: false, foreign_key: true|

###Association
-belongs_to :purchase_history