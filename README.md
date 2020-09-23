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
  - root channelの一覧取得
    - GET: /channels 
      - {"channels":[{"id":1, "name":"channel name", "abstract":"chanel abstract", "num_of_comments":1, "num_of_events":1},...,{}]} 
- events
  - event作成
    - POST: /events -H application:json -d {"name":"hoge", "abstract":"fuga", "channel_id":1, "host_user_id":2,"host_date":"2020-10-05 00:00:00","from_date":"2020-10-05 00:00:00","to_date":"2020-10-05 00:00:00"}
      - {"id":13,"channel_id":1,"name":"hoge","abstract":"fuga","zoom_url":"https://zoom.us/j/98725049091?pwd=WmNPL25WZkdyYzY4MHVIK01qTXFkdz09","host_date":"2020-10-05T00:00:00.000Z","from_date":null,"to_date":null,"is_delete":false,"created_at":"2020-09-18T13:39:10.000Z","updated_at":"2020-09-18T13:39:10.000Z"}
     
 
  - event一覧
    - GET: /events?channel_id={id}
      - { 
          {event_id, event_name, event_abstract, host_date, from,to,zoom_url},
            ...
        }

  - event詳細
    - GET: /events/:id
      - { 
          event_id, event_name, event_abstract, host_user_id, channel_id, host_date, from_date, to_date, zoom_url
        }
        
 - event参加
    - POST: /events/:id/participate/:user_id
      - 作成成功時
        - {status code: 200}
      - 作成失敗時
        - {status code: 400}
