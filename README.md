# StockDots

## サイト概要
蓄積してきた学習一つひとつ＝"点"として、"点"を利用者と共有して"線"にしていくことで学習の深め、自分ひとりで簡潔してしまっていた学びを誰かの学習に役立てるサイトです。

#### 利用者側から見える機能

- 学習内容投稿、いいね、コメントの基本的なCRUD機能
- 記事検索機能
- 学習ジャンル検索機能
- フォロー機能
- リンク機能(投稿したURLがaタグになる) 
- ハッシュタグ作成・検索機能　
- リッチテキストエディタを用いた投稿フォーム(summernote)
- 非同期通信(js.erbを使用していいね機能、コメント機能実装)
- レスポンシブ対応（PC,スマホサイズで対応）

#### セキュリティ面含め、その他の機能

- 管理者側からの投稿の表示、非表示機能
- ユーザー、管理者認証（Device使用）
- メール認証
- 環境変数を利用し、Gitへ反映させる情報の管理（dotenv-rails）
- rubocop-airbnbを利用
- AWSを使用したデプロイ(EC2,RDS)
- ドメイン取得
- デバック(pry-byebug,pry-rails)
- cancancanを利用した権限管理

### サイトテーマ
　学んできたことを蓄積して、誰かの成長に繋げる学習内容投稿サイト

### テーマを選んだ理由
　時間をかけてやってきたことが"形"として残っていないことで、理解するよりも調べることに多くの時間を費やしてしまうことが、とてももったいないと感じていました。なので、学習や経験を蓄積・アウトプットし、さらにそれを引用・参考し合って、誰かの学びの手助けになるアプリがあればいいと思いました。<br> 
　そこで一人ひとりが学習してきたことを"点"として蓄積し、それを利用者が引用・参考し合い”線”として紡いでいくことで、交流していけるサイトがあればと考え開発することに決めました。
　

### ターゲットユーザ
- 年齢：問わない
- 性別：男女問わない
- 学習や体験のアウトプットする場を探している人
- 学習や体験を分かち合いたい人

### 主な利用シーン
- 日々の学習アウトプットしたい時
- 自分が学びたいことをどのように学習しているか調べたい時
- 自分が初めてやることの体験談を知りたい時


## 設計書
- [ER図](https://app.diagrams.net/#G1lqGCPIpoZtL1XC4eYdmog-ejCv86asTs)
- [テーブル設計書](https://docs.google.com/spreadsheets/d/1rvcGUG_UeqFkNMgmC0l_rzzV_QBOKMKKpHx19gXYyLA/edit#gid=1240478325)
- [アプリケーション詳細設計](https://docs.google.com/spreadsheets/d/1Me5UXp0drpDdBsKSQn2rEVvOQ0U5hxwxxstVq9rLdkI/edit#gid=2133469642)

## [チャレンジ要素一覧](https://docs.google.com/spreadsheets/d/1oKQga6FtqoK-wivMC0YBypGm8VT52MBMIYnnaxDT0Cc/edit#gid=2012246441)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
