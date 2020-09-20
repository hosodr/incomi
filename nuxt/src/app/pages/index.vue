<template>
  <div>
    <div class="jumbotron">
      <h1 class="display-4">incomi</h1>
      <p class="lead">雑談・勉強会を気軽に</p>
    </div>
    <div class="container">
      <div class="row justify-content-center">
        <h3 class="text-center">3つの機能</h3>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-3 text-center">
          <img src="@/assets/anonymous.svg" height="100px" />
          <h4>匿名投稿</h4>
          <p>
            匿名投稿により，既に出来上がっているコミュニティへの参加の敷居が低くなる
          </p>
        </div>
        <div class="col-md-3 text-center">
          <img src="@/assets/anonymous.svg" height="100px" />
          <h4>チャット機能</h4>
          <p>
            まずは自分の趣味に合うチャンネルを登録し，気軽にチャットを楽しみましょう
          </p>
        </div>
        <div class="col-md-3 text-center">
          <img src="@/assets/anonymous.svg" height="100px" />
          <h4>イベント作成機能</h4>
          <p>
            話が深まってきたら勉強会を開催してみましょう．incomiならば簡単にzoomを用いた勉強会を作成できます
          </p>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-md-5 mr-1">
          <div class="row card-header">
            <h5 class="text-center">最新のチャンネル</h5>
          </div>
          <div class="row list-group">
            <template v-for="channel in channels">
              <ChannelItem :key="channel.id" :channel="channel" />
            </template>
          </div>
        </div>
        <div class="col-md-5 ml-1">
          <div class="row card-header">
            <h5 class="text-center">最新のイベント</h5>
          </div>
          <div class="row justify-content-center">
            <template v-for="event in events">
              <EventItem :key="event.id" :event="event" />
            </template>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      channels: [
        { id: 1, abstract: '初心者のための勉強会', name: '機械学習' },
        { id: 2, abstract: '初心者のための勉強会', name: 'Vue.js勉強会' },
        { id: 3, abstract: '初心者のための勉強会', name: 'rails 勉強会' },
        { id: 4, abstract: '初心者のための勉強会', name: 'react勉強会' },
        { id: 5, abstract: '初心者のための勉強会', name: 'html' },
      ],
      events: [
        {
          evId: 2,
          thId: 3,
          hostId: 3,
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          expiredDate: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
          deleteFlag: false,
        },
        {
          evId: 2,
          thId: 3,
          hostId: 3,
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          expiredDate: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
          deleteFlag: false,
        },
        {
          evId: 2,
          thId: 3,
          hostId: 3,
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          expiredDate: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
          deleteFlag: false,
        },
      ],
    }
  },
}
</script>

<style scoped>
.jumbotron {
  background: url('https://publicdomainq.net/images/201809/21s/publicdomainq-0026514afg.jpg')
    center no-repeat;
  background-size: cover;
  height: 400px;
}
</style>
