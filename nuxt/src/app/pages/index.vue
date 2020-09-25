<template>
  <div>
    <div class="jumbotron mb-0">
      <h1 class="display-4 incomi">incomi</h1>
      <p class="lead">Let's unleash your thirst for knowledge</p>
    </div>

    <div class="container py-5">
      <div class="row justify-content-center">
        <h2 class="text-center">
          Let's <strong>learn</strong>, <strong>talk</strong>, and
          <strong>connect</strong> more about IT
        </h2>
      </div>
      <div class="row justify-content-center">
        <ul>
          <li>I want to learn about new technology</li>
          <li>
            I want to talk with people who are interested in the same field
          </li>
          <li>I want to do something by connecting with other engineers</li>
        </ul>
      </div>
    </div>
    <div class="py-5" style="background-color: #4b64a1; color: white">
      <div class="container">
        <div class="row justify-content-center">
          <h2 class="text-center">Three Functions</h2>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-3 text-center">
            <img class="my-3" src="@/assets/anonymous.svg" height="100px" />
            <h4>Anonymous post</h4>
            <p>Feel free to talk and listen to any community.</p>
          </div>
          <div class="col-md-3 text-center">
            <b-icon
              class="my-3"
              icon="chat-dots"
              style="width: 100px; height: 100px"
            ></b-icon>

            <h4>Chat function</h4>
            <p>
              You can register a channel that matches your interests and enjoy
              chatting easily.
            </p>
          </div>
          <div class="col-md-3 text-center">
            <b-icon
              class="my-3"
              icon="calendar2-event"
              style="width: 100px; height: 100px"
            ></b-icon>
            <h4>Creating Events</h4>
            <p>
              If you are interested in the topic, let's hold a study group.
              incomi can help you create a study group with zoom.
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="container my-5">
      <div class="row justify-content-center">
        <div class="col-md-5 mr-1">
          <div class="row card-header">
            <h5 class="text-center mb-0">latest channels</h5>
          </div>
          <div class="row list-group height-fixed scroll">
            <template v-for="channel in channels">
              <ChannelItem :key="channel.id" :channel="channel" />
            </template>
          </div>
        </div>
        <div class="col-md-5 ml-1">
          <div class="row card-header">
            <h5 class="text-center mb-0">latest events</h5>
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
  async fetch() {
    await this.getEventInfo()
    await this.getChannels()
  },
  data: () => {
    return {
      events: [],
      channels: [],
    }
  },
  methods: {
    async getChannels() {
      const tmp = await this.$axios
        .get('/api/channels.json')
        .then((res) => res.data)
      const channels = tmp.channels
      for (let i = 0; i < channels.length; i++) {
        channels[i].numOfComments = channels[i].num_of_comments
        channels[i].numOfEvents = channels[i].num_of_events
      }
      this.channels = channels
    },
    async getEventInfo() {
      this.events = await this.$axios
        .get('/api/events.json')
        .then((res) => res.data.events)
    },
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
