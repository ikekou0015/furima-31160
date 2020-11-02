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
| last_name_furigana  | string    | null: false |
| first_name_furigana | string    | null: false |

### Association
- has_many :items
- has_one :order

## addresses テーブル
| Column         | Type      | Options                        |
| --------       | ------    | -----------                    |
| postal_code    | string    | null: false                    |
| prefectures_id | integer   | null: false                    |
| municipalities | string    | null: false                    |
| address        | string    | null: false                    |
| building       | string    |                                |
| phone_number   | string    | null: false                    |
| order          | references| foreign_key: true | 
 
### Association
- belongs_to :order


## items テーブル
| Column      | Type       | Options                       |
| ------      | ------     | -----------                   |
| name        | string     | null: false                   |
| category_id | integer    | null: false                   |
| price       | integer    | null: false                   |
| condition_id| integer    | null: false                   |
| cost_id     | integer    | null: false                   |
| soures_id   | integer    | null: false                   |
| date_id     | integer    | null: false                   |
| user        | references | foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column     | Type          | Options                        |
| ------     | ----------    | ------------------------------ |
| item       | references    | foreign_key: true |
| user       | references    | foreign_key: true |
 
### Association
 
- belongs_to :user
- belongs_to :item

