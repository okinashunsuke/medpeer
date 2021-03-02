# README

## categories テーブル   アイディアのカテゴリーを保存するテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| id          | bigint     |                                |
| name        | string     | null: false, unique: true      | 

## ideas テーブル    アイディアを保存するテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| id          | bigint     |                                |
| category_id | references | null: false, foreign_key: true |  
| body        | text       | null: false                    |  
