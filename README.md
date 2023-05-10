# アプリケーション名
[![Image from Gyazo](https://i.gyazo.com/081c4566d6ca0effc575697a9b7af2b1.png)](https://gyazo.com/081c4566d6ca0effc575697a9b7af2b1)  

Quickbuildings

# アプリケーション概要
ビルに関わる業務において簡易に情報の確認と共有できるアプリを作成しました  
竣工情報など古い資料から調べる時間の削減、簡易工事報告や履歴やなどのデジタル化で効率の向上を狙います

# URL
https://quickbuildings.onrender.com
# テスト用アカウント
０００テスト
メールアドレス: megyameri@eay.jp
パスワード: testtest3

# 利用方法
ログインすることで自社で担当しているビルの情報を見ることができます
また通常業務で行う報告書とは別として、簡易に報告や連携できる簡易報告を使うことができます  
ビル情報の入力は管理者しかできない設定にしています  
  

# アプリケーションを作成した背景
前職において「手書きで業務日誌に記載」「ビルの情報を調べる際は棚にて調べる」などアナログな文化で働いていた際に
少しでも便利に仕事の効率化をしたいと考えた際に構想が浮かびました  
緊急時に口頭で答える場合もあったので文字として残し共有し円滑な対応をサポートを目標とし作成しました  
# 洗い出した要件


# 実装した機能についての画像やGIFおよびその説明  　　

ログインすることでトップページに並ぶビルのリンクから詳細ページを見ることができます　　　
[![Image from Gyazo](https://i.gyazo.com/be929beeeae2ba564a02dd966e6d4c3b.jpg)](https://gyazo.com/be929beeeae2ba564a02dd966e6d4c3b)

詳細ページでは情報の確認と簡易報告をすることができます
簡易報告したユーザーは削除ボタンで自分の報告を削除することができます　　

[![Image from Gyazo](https://i.gyazo.com/aafb5692318446b1f6be07e036dcf5ba.gif)](https://gyazo.com/aafb5692318446b1f6be07e036dcf5ba)



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



