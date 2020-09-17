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
