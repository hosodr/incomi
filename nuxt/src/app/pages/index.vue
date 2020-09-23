<template>
  <div>
    <div class="jumbotron mb-0">
      <h1 class="display-4 incomi">incomi</h1>
      <p class="lead">雑談・勉強会を気軽に</p>
    </div>

    <div class="container py-5">
      <div class="row justify-content-center">
        <h2 class="text-center">勉強に困ってませんか？</h2>
      </div>
      <div class="row justify-content-center">
        <ul>
          <li>ある話題について誰かと話したい...</li>
          <li>slackのワークスペースなど既成のコミュニティには入りづらい...</li>
          <li>connpassの勉強会に参加するのは敷居が高い...</li>
        </ul>
      </div>
    </div>
    <div class="py-5" style="background-color: #4b64a1; color: white">
      <div class="container">
        <div class="row justify-content-center">
          <h2 class="text-center">3つの機能</h2>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-3 text-center">
            <img class="my-3" src="@/assets/anonymous.svg" height="100px" />
            <h4>匿名投稿</h4>
            <p>
              匿名投稿により，既に出来上がっているコミュニティへの参加の敷居が低くなります
            </p>
          </div>
          <div class="col-md-3 text-center">
            <b-icon
              class="my-3"
              icon="chat-dots"
              style="width: 100px; height: 100px"
            ></b-icon>

            <h4>チャット機能</h4>
            <p>
              自分の趣味に合うチャンネルを登録し，気軽にチャットが楽しめます
            </p>
          </div>
          <div class="col-md-3 text-center">
            <b-icon
              class="my-3"
              icon="calendar2-event"
              style="width: 100px; height: 100px"
            ></b-icon>
            <h4>イベント作成機能</h4>
            <p>
              話が深まってきたら勉強会を開催してみましょう．<span class="incomi"
                >incomi</span
              >ならば簡単にzoomを用いた勉強会を作成できます
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="container my-5">
      <div class="row justify-content-center">
        <div class="col-md-5 mr-1">
          <div class="row card-header">
            <h5 class="text-center">最新のチャンネル</h5>
          </div>
          <div class="row list-group height-fixed scroll">
            <template v-for="channel in channels">
              <ChannelItem
                :key="channel.channel.channelId"
                :channel="channel"
              />
            </template>
          </div>
        </div>
        <div class="col-md-5 ml-1">
          <div class="row card-header">
            <h5 class="text-center">最新のイベント</h5>
          </div>
          <div class="row justify-content-center height-fixed scroll">
            <template v-for="event in events">
              <EventItem :key="event.id" :event="event" />
            </template>
          </div>
        </div>
      </div>
    </div>
    <div class="py-3" style="background-color: #4b64a1; color: white">
      <div class="container">
        <div class="row justify-content-center">
          <table>
            <th>
              <img
                src="@/assets/gunjoiro_rabit.png"
                width="50"
                class="d-inline-block mx-3"
              />
            </th>
            <td>
              <h5>produced by <span>gunjoiro rabit</span></h5>
            </td>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import Vue from 'vue'

Vue.use(BootstrapVue)
Vue.use(IconsPlugin)

export default {
  components: {},
  data: () => {
    return {
      events: null,
      channels: null,
    }
  },
  created() {
    this.events = this.$getChannelEventInfo(this.channelId)
    this.channels = this.$getChannels()
  },
}
</script>

<style scoped>
.jumbotron {
  background: url('https://publicdomainq.net/images/201809/21s/publicdomainq-0026514afg.jpg')
    center no-repeat;
  background-size: cover;
  height: 600px;
}
</style>
