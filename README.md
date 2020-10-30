# テーブル設計
## users テーブル
| Column     | Type      | Options     |
| --------   | ------    | ----------- |
| email      | string    | null: false |
| password   | string    | null: false |
| name       | string    | null: false |
| birthday   | integer   | null: false |
| full_name  | string    | null: false |
| furigana   | string    | null: false |


### Association
- has_many :items
- has_one  :addresses
- has_one  :purchase

## addresses テーブル
| Column         | Type      | Options     |
| --------       | ------    | ----------- |
| postal_code    | integer   | null: false |
| prefectures    | string    | null: false |
| municipalities | string    | null: false |
| address        | string    | null: false |
| building       | string    | null: false |
| phone_number   | integer   | null: false |
| user_id    | references| null: false, foreign_key: true|
 
### Association
- belongs_to :user
- belongs_to :item

## items テーブル
| Column    | Type       | Options     |
| ------    | ------     | ----------- |
| item_name | string     | null: false |
| category  | string     | null: false |
| price     | integer    | null: false |
| user_id   | references | null: false |
| seller    | string     | null: false |
| condition | string     | null: false |
| cost      | string     | null: false |
| soures    | string     | null: false |
| date      | integer    | null: false |
| user_id   | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order
- has_one :address

## orders テーブル
| Column     | Type          | Options                        |
| ------     | ----------    | ------------------------------ |
| user       | string        | null: false                    |
| order      | string        | null: false                    |
| item       | string        | null: false                    |
| user_id    | references    | null: false   foreign_key: true|
 
### Association
 
- belongs_to :user
- belongs_to :item

