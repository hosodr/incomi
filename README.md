# インコミ
チームぐんじょう色らびっとの成果物です。


# instal
Dockerのインストールは完了していることを想定しています。まだの場合は公式のドキュメントなどを見ながらやってみてください。

まずは`git clone`をしてプロジェクトのディレクトリにはいります
> git clone https://github.com/hosodr/incomi.git <br>
> cd incomi <br>

つぎにDockerイメージをビルドします.<br>
この工程にはそこそこ時間がかかるので通信状況の良い場所で少しまってください.
> docker-compose build <br>


buildが終わったらDBの初期化を行います。
> docker-compose run --rm back rails db:create<br>
> docker-compose run --rm back rails db:migrate<br>

MySQLコンテナの立ち上げに少し時間がかかる場合があります。このとき以下のようなエラーでDBとの接続に失敗しますが多分大丈夫です。少し待ってからもう一度試してください。<br>
`#<Mysql2::Error::ConnectionError: Can't connect to MySQL server on 'db' (115)>
Couldn't create database for {"adapter"=>"mysql2", "encoding"=>"utf8", "pool"=>5, "username"=>"root", "password"=>"root_pass", "host"=>"db", "database"=>"rails_app_development"}, {:charset=>"utf8"}
`

DBの初期化に成功したらコンテナを立ち上げて確認してみます。
> docker-compose up -d <br>
> docker-compose ps<br>
これでコンテナが３つ立ち上がっているのを確認できたらOKです

まずは以下のURLにアクセスしてください
> http://localhost:3000<br>
> http://localhost:8080

# API
- channels 
  - channel作成
    - POST: /channels -H Content-Type: application:json -d {"name":"hoge", "abstract":"fuga", "parent_channel_id":1, "parent_comment_id":1}
  - root channelの一覧取得
    - GET: /channels 
      - {"channels":[{"id":1, "name":"channel name", "abstract":"chanel abstract", "num_of_comments":1, "num_of_events":1},...,{}]} 
  - channelの詳細情報
    - GET: /channels/:id
      - {"id":1,"parent_channel_id":null,"parent_comment_id":null,"name":"hoge","abstract":"hoge","created_at":"2020-09-23T01:45:24.000Z","updated_at":"2020-09-23T01:45:24.000Z","is_root":true}
- comments
  - channel_idにひもづいたcomment一覧の取得
    - GET: /comments/channel/:channel_id
      - {"comments":[
          {"id":1,"user_id":1,"channel_id":1,"message":"hoge","child_channel_id":3,"num_of_comments":5},
          {"id":19,"user_id":1,"channel_id":1,"message":"hoge hoge","child_channel_id":null,"num_of_comments":null},
          ,...,{}
        ]}
  - comment投稿
    - POST: /comments -H Contet-Type: application/json -d {"user_id":1, "channel_id":1, "message": "hogehoge"}
      - {"id":13,"user_id":1,"channel_id":1,"message":"hogehoge","created_at":"2020-09-23T09:01:45.000Z","updated_at":"2020-09-23T09:01:45.000Z","url":"http://localhost:3000/comments/13.json"}
- events
  - event作成
    - POST: /events -H Content-Type: application:json -d {"name":"hoge", "abstract":"fuga", "channel_id":1, "host_user_id":2,"host_date":"2020-10-05 00:00:00","from_date":"2020-10-05 00:00:00","to_date":"2020-10-05 00:00:00"}
      - {"id":13,"channel_id":1,"name":"hoge","abstract":"fuga","zoom_url":"https://zoom.us/j/98725049091?pwd=WmNPL25WZkdyYzY4MHVIK01qTXFkdz09","host_date":"2020-10-05T00:00:00.000Z","from_date":null,"to_date":null,"is_delete":false,"created_at":"2020-09-18T13:39:10.000Z","updated_at":"2020-09-18T13:39:10.000Z"}
     
 
  - event一覧/検索
    - GET: /events?channel_id={id}&word={word}
      - { 
          "events": [
            { "id", "channel_id", "name", "abstruct", "zoom_url", "host_date", "from_date", "to_date", "is_delete", "created_at", "update_at", "host_user_id"}
            ...
          ]
        }

  - event詳細
    - GET: /events/:id
      - { 
             "id", "channel_id", "name", "abstruct", "zoom_url", "host_date", "from_date", "to_date", "is_delete", "created_at", "update_at", "host_user_id"
        }
        
  - event参加
    - POST: /events/:id/participate/:user_id
      - 作成成功時
        - {status code: 200}
      - 作成失敗時
        - {status code: 400}
  - event 参加取り消し
    - DELETE: /events/:id/cancel/:user_id
        
