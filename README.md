# Mahjong Score & Data

# アプリケーション概要
- 麻雀を打つ際に面倒なポイント計算を対局終了時にスコアを入力するだけで自動でやってくれる
- 自分の対戦成績を確認することができる

# URL
https://mahjong-score-34534.herokuapp.com/

# テスト用アカウント
メールアドレス:test@com
パスワード:test0000

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
- 趣味が麻雀で麻雀を打つもののポイントの計算が計算ミスが多くて煩わしいという人の作業効率化
- 麻雀の成績が気になる人が成績を確認するため

# 洗い出した要件

## ユーザー認証機能
### ユーザー毎にデータを管理するため
### ユーザーの新規登録、ログイン、ログアウトをできるようにする
- Deviceを導入し名前、メールアドレス、パスワードを登録すると新規登録できる
- 登録されているメールアドレス、パスワードを入力するとログインできる

## 新規対局機能
### 新たな対戦結果を残すため
### 新規対局時のメンバー、ルールを決定することができる
- メンバーの3人の名前の入力とルールの選択をすると新規対局を始めることができる

## ポイント計算機能
### スコアを比較しポイントに換算するため
### 新規対局の際に決めたルールとスコアに基づいてポイントを計算する
- 各々のスコアを入力することでポイントを計算し保存することができる
- 複数の対局データを同時に保存することもできる

## 対局結果表示機能
### 対局の総合結果を表示するため
### 全対局のトータルポイントから各々の収支を計算し表示する
- 精算ボタンを押すと対局を終了しそれまでのトータルスコアから収支を計算し表示する

## マイページ機能
### 個人の通算結果を確認するため
### ユーザー詳細ページから今までの自分の対戦成績を確認することができる
- マイページへ遷移すると今までの平均順位、平均ポイントを確認し振り返ることができる

# 実装した機能についてのGIFと説明
実装後記入

# 実装予定の機能
- 三人麻雀にも対応
- ルールの選択肢追加

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