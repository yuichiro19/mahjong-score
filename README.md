# Mahjong Score & Data
# アプリケーション概要
- 麻雀を打つ際に面倒なポイント計算を対局終了時にスコアを入力するだけで自動でやってくれる
- 自分の対戦成績を確認することができる
# URL
デプロイ後載せる
# テスト用アカウント
デプロイ後載せる
# 利用方法
- スコア自動計算の仕方
1. アカウント登録をする
1. 新規対局をクリック
1. メンバーの名前の記入、ルールの選択をし開局をクリック
1. 対局を終える毎にスコアを記入
1. 全対局を終えたら精算をクリック
1. 全対局のトータル収支が表示される

- 対戦成績の確認

1. 対戦したことのあるアカウントでログインする
1. マイページをクリック
1. 個人の全対戦成績が表示される
# 目指した課題解決
# 洗い出した要件
# 実装した機能についてのGIFと説明
# 実装予定の機能

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

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_score      | integer    | null: false                    |
| guest1_score    | integer    | null: false                    |
| guest2_score    | integer    | null: false                    |
| guest3_score    | integer    | null: false                    |
| user_rank_id    | integer    | null: false                    |
| guest1_rank_id  | integer    | null: false                    |
| guest2_rank_id  | integer    | null: false                    |
| guest3_rank_id  | integer    | null: false                    |
| user_point      | integer    | null: false                    |
| guest1_point    | integer    | null: false                    |
| guest2_point    | integer    | null: false                    |
| guest3_point    | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| game_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :game
- belongs_to :user

# ローカルでの動作方法