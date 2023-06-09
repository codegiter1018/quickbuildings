# アプリケーション名
[![Image from Gyazo](https://i.gyazo.com/081c4566d6ca0effc575697a9b7af2b1.png)](https://gyazo.com/081c4566d6ca0effc575697a9b7af2b1)  

Quickbuildings

# アプリケーション概要
ビルに関わる業務において簡易に情報の確認と共有できるアプリを作成しました  
竣工情報など古い資料から調べる時間の削減、簡易工事報告や履歴やなどのデジタル化で効率の向上を狙います

# URL
https://quickbuildings.onrender.com  
  
# テスト用アカウント
ベーシック認証  
ID：admin  
PASS：2222   

ユーザー名:０００テスト  
メールアドレス: megyameri@eay.jp  
パスワード: testtest3


# 利用方法
ログインすることで自社で担当しているビルの情報を見ることができます
また通常業務で行う報告書とは別として、簡易に報告や連携できる簡易報告を行うことができます  
ビル情報の入力は管理者しかできない設定にしています  
  

# アプリケーションを作成した背景
前職において「手書きで業務日誌に記載」「ビルの情報を調べる際は倉庫の竣工図書にて調べる」などアナログな文化で働いていた際に
少しでも便利に仕事の効率化をしたいと考え構想が浮かびました  
緊急時に口頭で答える場合もあったので文字として残し共有し円滑な対応をサポートを目標とし作成しました  

# ユーザーストーリー
メインターゲットは「現場（設備管理）・PCに慣れてない40代〜60代」を想定し  
・ページ移動を最小限にすることでシンプルに業務中に使えるようにする
・業務報告書や日誌など書く際に簡易メモとしても使えるようにする  
  

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1aIUQaprcGG7ScO9V3gniw3I5soULinVWAOjCl3_fQ5M/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明  　　

ログインすることでトップページに並ぶビルのリンクから詳細ページを見ることができます　　　
[![Image from Gyazo](https://i.gyazo.com/be929beeeae2ba564a02dd966e6d4c3b.jpg)](https://gyazo.com/be929beeeae2ba564a02dd966e6d4c3b)

詳細ページでは情報の確認と簡易報告をすることができます
簡易報告したユーザーは削除ボタンで自分の報告を削除することができます　　

[![Image from Gyazo](https://i.gyazo.com/aafb5692318446b1f6be07e036dcf5ba.gif)](https://gyazo.com/aafb5692318446b1f6be07e036dcf5ba)


# 実装予定の機能
・一定の時間操作しなかったらログアウトさせる（5/20実装）  
・トップページの表示を都道府県ごとに表示を分ける  

  


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



