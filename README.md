# テーブル設計
## users テーブル
| Column              | Type      | Options     |
| --------            | ------    | ----------- |
| email               | string    | null: false |
| encrypted_password  | string    | null: false |
| name                | string    | null: false |
| birthday            | date      | null: false |
| last_name           | string    | null: false |
| first_name          | string    | null: false |
| last_name(furigana) | string    | null: false |
| first_name(furigana)| string    | null: false |

### Association
- has_many :items
- has_one  :addresses

## addresses テーブル
| Column         | Type      | Options     |
| --------       | ------    | ----------- |
| postal_code    | string    | null: false |
| prefectures_id | integer    | null: false |
| municipalities | string    | null: false |
| address        | string    | null: false |
| building       | string    | null: false |
| phone_number   | string   | null: false |
| user_id        | references| null: false, foreign_key: true|
 
### Association
- belongs_to :order


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
| user      | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :order

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

