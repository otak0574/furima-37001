*Usersテーブル*
|column              |Type       |Options    |
|--------------------|-----------|-----------|
|nickname            |string     |null: false|
|mail                |string     |null: false, unique: true|
|encrypted_password  |string     |null: false|
|last_name           |string     |null: false|
|first_name          |string     |null: false|
|last_name_kana      |string     |null: false|
|first_name_kana     |string     |null: false|
|birthday_date       |integer    |null: false|
|birthday_month      |integer    |null: false|
|birthday_year       |integer    |null: false|

###Association
-has_many :items
-has_one  :pay



*itemsテーブル*
|column           |Type       |Options    |
|-----------------|-----------|-----------|
|price            |integer    |null: false|
|image            |text       |null: false|
|name             |string     |null: false|
|description      |text       |null: false|
|spec             |string     |null: false|
|shipping_fee     |text       |null: false|
|shipping_address |text       |null: false|
|days             |text       |null: false|

###Association
-belongs_to :user
-has_one :order


*paysテーブル*
|column           |Type       |Options    |
|-----------------|-----------|-----------|
|number           |integer    |null: false|
|expiration_date  |integer    |null: false|
|security_code    |integer    |null: false|

###Association
-has_many orders
-belongs_to user


*orders*
|column           |Type       |Options    |
|-----------------|-----------|-----------|
|post_number      |integer    |null: false|
|prefectures      |string     |null: false|
|city             |string     |null: false|
|street_address   |text       |null: false|
|building         |text       |           |
|telephone_number |integer    |null: false|

###Association
-belongs_to :item
-belongs_to :pay


<!-- *comments*
|column           |Type       |Options    |
|-----------------|-----------|-----------|
|content          |text       |null: false| -->
<!-- 
###Association
-
- -->