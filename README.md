# テーブル設計
## users テーブル
| Column              | Type      | Options     |
| --------            | ------    | ----------- |
| email               | string    | null: false |
| encrypted_password  | string    | null: false |
| nick_name           | string    | null: false |
| birth_date          | date      | null: false |
| last_name           | string    | null: false |
| first_name          | string    | null: false |
| last_name_kana  | string    | null: false |
| first_name_kana | string    | null: false |

### Association
- has_many :items
- has_one :order

## addresses テーブル
| Column                 | Type      | Options      |
| --------               | ------    | -----------  |
| postal_code(郵便番号)   | string    | null: false  |
| prefectures_id(都道府県)| integer   | null: false  |
| city(市、区)            | string    | null: false  |
| addresses(番地)         | string    | null: false  |
| building(建物名､部屋番号)| string    |              |
| phone_number(電話番号)  | string    | null:false   |
| order(購入者)         | references| foreign_key: true | 
 
### Association
- belongs_to :order


## items テーブル
| Column                 | Type       | Options            |
| ------                 | ------     | -----------        |
| name                   | string     | null: false        |
| category_id            | integer    | null: false        |
| info                   | text       | null: false        |
| sales_status           | integer    | null: false        |
| shipping_fee_status    | integer    | null: false        |
| prefecture             | integer    | null: false        |
| scheduled_delivery     | integer    | null: false        |
| price                  | integer    | null: false        |
| user                   | references | foreign_key: true  |

### Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column     | Type          | Options           |
| ------     | ----------    | ----------------- |
| item       | references    | foreign_key: true |
| user       | references    | foreign_key: true |
 
### Association
 
- belongs_to :user
- belongs_to :item
- has_one :addresses

