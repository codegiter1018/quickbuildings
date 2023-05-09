# アプリケーション名

Quickbuildings

# アプリケーション概要
ビルに関わる業務において簡易に情報を共有できる事ができます
竣工情報など古い資料から調べる時間の削減、簡易工事報告や履歴やなどのデジタル化で効率の向上を狙います

# URL

# テスト用アカウント
# 利用方法
新規登録を行い、自社で担当しているビルの情報を見ることができます
また通常業務で行う報告書とは別として、簡易に報告や連携できるコメントを使うことができます
業務用を意識しているのでビル情報の入力は管理者しかできない設定にしています
# アプリケーションを作成した背景
# 洗い出した要件



# DB 設計

## users table

| Column              | Type                | Options                     |
|---------------------|---------------------|-----------------------------|
| name                | string              | null: false                 |
| email               | string              | null: false, unique: true   |
| encrypted_password  | string              | null: false                 |
| department          | string              | null: false                 |
| admin               | boolean             | null: false, default: false |

### Association


- has_many :buildings
- has_many :comment





## building table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user                                | references | null: false, foreign_key: true |
| prefecture                          | string     | null: false                    |
| buildings_name                      | string     | null: false                    |
| address                             | string     | null: false                    |
| completion                          | date       | null: false                    |
| renewal                             | date       |                                |
| description                         | text       | null: false                    | 


### Association

- belongs_to :user
- has_many :comment 




## comment table
| Column           | Type                      | Options                            |
|------------------|---------------------------|------------------------------------|
| user             | references                | null: false, foreign_key: true     |
| building         | references                | null: false, foreign_key: true     |
| content          | text                      | null: false                        |


### Association

- belongs_to :user
- belongs_to :building



