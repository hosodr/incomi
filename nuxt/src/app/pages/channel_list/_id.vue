<template>
  <div class="container">
    <div class="row mt-3">
      <div class="col-8">
        <div class="row card-header mr-1">
          <div class="col-auto mr-auto">
            <h4 class="d-inline-block">
              <b-icon-chat-right-text-fill />
              {{ thread.name }}
            </h4>

            <b-button
              v-if="addMyChannel"
              id="is-favorite"
              variant="text"
              class="d-inline-block text-primary"
              @click="addMyChannel = !addMyChannel"
              ><b-icon-suit-heart-fill
            /></b-button>
            <b-button
              v-else
              id="not-favorite"
              variant="text"
              class="d-inline-block text-primary"
              @click="addMyChannel = !addMyChannel"
              ><b-icon-suit-heart />
            </b-button>

            <b-popover
              target="is-favorite"
              :show.sync="addMyChannel"
              triggers="click"
              placement="top"
            >
              <strong>add your channel list!</strong>
            </b-popover>
            <p class="mb-0">{{ thread.abstract }}</p>
          </div>

          <div class="col-auto">
            <nuxt-link
              class="btn btn-sm btn-outline-primary"
              to="/event_list/make_event"
              >create an event</nuxt-link
            >
            <!-- <nuxt-link class="btn btn-sm btn-outline-primary" to="/event_list"
              >view events</nuxt-link
            > -->
            <button
              type="button"
              class="btn btn-sm btn-outline-primary"
              @click="isThread = false"
            >
              view events
            </button>
          </div>
        </div>
        <div class="row">
          <ul class="col list-group height-fixed scroll">
            <template v-for="(message, key) in messages">
              <Message
                :key="key"
                :message="message"
                :parent-th-id="thread.parentThId"
                :get-thread="getThread"
                :show-thread="showThread"
              />
            </template>
          </ul>
        </div>
        <div class="row">
          <div class="col list-group">
            <form class="form-group">
              <div class="input-group mb-3">
                <textarea
                  class="form-control"
                  placeholder="add comment"
                ></textarea>
                <div class="input-group-append">
                  <button class="btn btn-outline-primary" type="button">
                    <b-icon-cursor />
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div v-if="isThread" class="col-4">
        <div class="row card-header mr-1">
          <p class="mb-0">
            <b-icon-chat-right-text-fill />
            {{ childThread.name }}
          </p>
        </div>
        <div class="row">
          <ul v-if="isThread" class="col list-group height-fixed scroll">
            <template v-for="(message, key) in childMessages">
              <Message
                :key="key"
                :message="message"
                :parent-th-id="childThread.parentThId"
                :get-thread="getThread"
                :show-thread="(isThread = true)"
              />
            </template>
          </ul>
        </div>
        <div class="row">
          <form class="col form-group">
            <div class="input-group mb-3">
              <textarea
                class="form-control"
                placeholder="add comment"
              ></textarea>
              <div class="input-group-append">
                <button class="btn btn-outline-primary" type="button">
                  <b-icon-cursor />
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>

      <div v-else class="col-4">
        <div class="row card-header">
          <p class="mb-0">
            <b-icon-calendar2-event-fill />
            Events
          </p>
        </div>
        <div class="row">
          <b-input-group size="sm" class="mb-2">
            <b-form-input
              type="search"
              placeholder="Search event"
            ></b-form-input>
            <b-input-group-prepend is-text>
              <b-icon-search />
            </b-input-group-prepend>
          </b-input-group>
        </div>
        <div class="row justify-content-center height-fixed scroll">
          <template v-for="event in events">
            <EventItem :key="event.id" :event="event" />
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {
  BIconSuitHeart,
  BIconSuitHeartFill,
  BIconCursor,
  BIconSearch,
  BIconCalendar2EventFill,
  BIconChatRightTextFill,
} from 'bootstrap-vue'
export default {
  components: {
    BIconSuitHeart,
    BIconSuitHeartFill,
    BIconCursor,
    BIconSearch,
    BIconCalendar2EventFill,
    BIconChatRightTextFill,
  },
  data: () => {
    const date = new Date().toDateString()
    return {
      addMyChannel: false,
      isThread: false,
      thread: {
        thId: 1,
        name: 'チャンネルの名前',
        abstract: 'このチャンネルの詳細このチャンネルの詳細',
        parentCommentId: 2,
        parentThId: null,
      },

      messages: [
        { msg: '何しようか', cmId: 1, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 2, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 3, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 4, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 5, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 1, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 2, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 3, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 4, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 5, timestamp: date, userId: 1 },
      ],
      childThread: null,
      childMessages: null,
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
  computed: {},
  methods: {
    getThread(thId, cmId) {
      const thread = {
        thId: 1,
        name: 'スレッドの名前',
        abstract: 'このすれっどの詳細',
        parentCommentId: 2,
        parentThId: 2,
      }
      const date = new Date().toDateString()
      const message = [
        { msg: '何しようか', cmId: 1, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 2, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 3, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 4, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 5, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 1, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 2, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 3, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 4, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 5, timestamp: date, userId: 1 },
      ]
      this.childThread = thread
      this.childMessages = message
    },
    showThread() {
      this.isThread = true
    },
  },
}
</script>

<style scoped>
.scroll {
  overflow-y: auto;
}

.height-fixed {
  height: 70vh;
}
</style>
