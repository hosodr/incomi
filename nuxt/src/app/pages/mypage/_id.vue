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
  async fetch() {
    const tmp = await this.$axios
      .get('/api/channels.json')
      .then((res) => res.data)
    const channels = tmp.channels
    for (let i = 0; i < channels.length; i++) {
      channels[i].numOfComments = channels[i].num_of_comments
      channels[i].numOfEvents = channels[i].num_of_events
    }
    this.channels = channels
    this.events = await this.$axios
      .get('/api/events.json?channel_id=1')
      .then((res) => res.data.events)
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
      channels: [],
      events: [],
    }
  },
  created() {},
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
