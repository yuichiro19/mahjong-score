# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :games
- has_many :scores

## games テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| guest1         | string     | null: false                    |
| guest2         | string     | null: false                    |
| guest3         | string     | null: false                    |
| rank_bonus_id  | integer    | null: false                    |
| top_bonus_id   | integer    | null: false                    |
| rate_id        | integer    | null: false                    |
| chip           | integer    |                                |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :scores

## scores テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_score   | integer    | null: false                    |
| guest1_score | integer    | null: false                    |
| guest2_score | integer    | null: false                    |
| guest3_score | integer    | null: false                    |
| user_rank    | integer    | null: false                    |
| guest1_rank  | integer    | null: false                    |
| guest2_rank  | integer    | null: false                    |
| guest3_rank  | integer    | null: false                    |
| user_point   | integer    | null: false                    |
| guest1_point | integer    | null: false                    |
| guest2_point | integer    | null: false                    |
| guest3_point | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| game_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :game
- belongs_to :user