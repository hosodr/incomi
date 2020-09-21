<template>
  <div class="container">
    <div class="row mt-5">
      <div class="col-md-8">
        <!-- ここからプロフィール -->
        <div class="card mb-3">
          <div class="card-header">
            <h5 class="mb-0 float-left"><b-icon-person-circle />Profile</h5>
            <a class="mb-0 float-right">modify</a>
          </div>
          <div class="card-body">
            <table class="table">
              <tbody>
                <tr>
                  <th class="px-0" scope="row">Name:</th>
                  <td class="text-break pr-0">{{ name }}</td>
                </tr>
                <tr>
                  <th class="px-0" scope="row">User id:</th>
                  <td class="text-break pr-0">{{ userId }}</td>
                </tr>
                <tr>
                  <th class="px-0" scope="row">Email:</th>
                  <td class="text-break pr-0">{{ email }}</td>
                </tr>
                <tr>
                  <th class="px-0" scope="row">Num of host channels:</th>
                  <td class="text-break pr-0">
                    {{ numOfHostChannel }} channels
                  </td>
                </tr>
                <tr>
                  <th class="px-0" scope="row">Num of host events:</th>
                  <td class="text-break pr-0">{{ numOfHostEvent }} events</td>
                </tr>
                <tr>
                  <th class="px-0" scope="row">Num of follow channels:</th>
                  <td class="text-break pr-0">{{ numOfFollowChannel }}</td>
                </tr>
                <tr>
                  <th class="px-0" scope="row">Num of attend events:</th>
                  <td class="text-break pr-0">{{ numOfAttendEvent }}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <!-- ここまでプロフィール -->
      <div class="col-md-4">
        <!-- ここからホストチャンネル -->
        <div class="card mb-3">
          <div class="card-header">
            <h5 class="mb-0"><b-icon-chat-dots />Host channels</h5>
          </div>
          <div class="card-body p-0 height-fixed scroll">
            <template v-for="channel in channels">
              <ChannelItem :key="channel.id" :channel="channel" />
            </template>
          </div>
        </div>
        <!-- ここまでホストチャンネル -->
      </div>

      <div class="col-md-4">
        <!-- ここからフォローしたイベント -->
        <div class="card mb-3">
          <div class="card-header">
            <h5 class="mb-0"><b-icon-calendar-2-event />Host events</h5>
          </div>
          <div class="card-body p-0 height-fixed scroll">
            <template v-for="event in events">
              <EventItem :key="event.id" :event="event" />
            </template>
          </div>
        </div>
        <!-- ここまでフォローしたイベント -->
      </div>

      <div class="col-md-4">
        <!-- ここからフォローしたチャンネル -->
        <div class="card mb-3">
          <div class="card-header">
            <h5 class="mb-0"><b-icon-chat-dots />Following channels</h5>
          </div>
          <div class="card-body p-0 height-fixed scroll">
            <template v-for="channel in channels">
              <ChannelItem :key="channel.id" :channel="channel" />
            </template>
          </div>
        </div>
        <!-- ここまでフォローしたチャンネル -->
      </div>

      <div class="col-md-4">
        <!-- ここからフォローしたイベント -->
        <div class="card mb-3">
          <div class="card-header">
            <h5 class="mb-0"><b-icon-calendar-2-event />Attend events</h5>
          </div>
          <div class="card-body p-0 height-fixed scroll">
            <template v-for="event in events">
              <EventItem :key="event.id" :event="event" />
            </template>
          </div>
        </div>
        <!-- ここまでフォローしたイベント -->
      </div>
    </div>
  </div>
</template>

<script>
import {
  BIconPersonCircle,
  BIconChatDots,
  BIconCalendar2Event,
} from 'bootstrap-vue'
export default {
  components: {
    BIconPersonCircle,
    BIconChatDots,
    BIconCalendar2Event,
  },
  data: () => {
    return {
      name: 'hoge',
      userId: 'hugeoaj',
      email: 'amammaammaahogheog@gmail.com',
      numOfHostChannel: 10,
      numOfHostEvent: 20,
      numOfFollowChannel: 222,
      numOfAttendEvent: 213,
      channels: [
        { id: 1, abstract: '初心者のための勉強会', name: '機械学習' },
        { id: 2, abstract: '初心者のための勉強会', name: 'Vue.js勉強会' },
        { id: 3, abstract: '初心者のための勉強会', name: 'rails 勉強会' },
        { id: 4, abstract: '初心者のための勉強会', name: 'react勉強会' },
        { id: 5, abstract: '初心者のための勉強会', name: 'html' },
        { id: 6, abstract: '初心者のための勉強会', name: 'css' },
        { id: 7, abstract: '初心者のための勉強会', name: '機械学習' },
        { id: 8, abstract: '初心者のための勉強会', name: 'Vue.js勉強会' },
        { id: 9, abstract: '初心者のための勉強会', name: 'rails 勉強会' },
        { id: 10, abstract: '初心者のための勉強会', name: 'react勉強会' },
        { id: 11, abstract: '初心者のための勉強会', name: 'html' },
        { id: 12, abstract: '初心者のための勉強会', name: 'css' },
      ],
      events: [
        {
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
        },
        {
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
        },
        {
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
        },
        {
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
        },
      ],
    }
  },
}
</script>

<style scoped>
.scroll {
  overflow-y: auto;
}

.height-fixed {
  height: 50vh;
}
</style>
