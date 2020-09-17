<template>
  <div class="container">
    <div class="row my-5">
      <h4 class="col-auto mr-auto">{{ thread.name }}</h4>
      <div class="col-auto">
        <button
          v-if="registar"
          type="button"
          class="btn btn-primary col-auto"
          @click="registar = !registar"
        >
          登録<b-icon-suit-heart />
        </button>
        <button
          v-else
          type="button"
          class="btn btn-primary"
          @click="registar = !registar"
        >
          登録解除<b-icon-suit-heart-fill />
        </button>
        <nuxt-link class="btn btn-primary" to="/event_list/make_event"
          >イベントを作成</nuxt-link
        >
        <nuxt-link class="btn btn-primary" to="/event_list"
          >イベント一覧</nuxt-link
        >
      </div>
    </div>

    <div class="row">
      <ul class="col-9 list-group height-fixed scroll">
        <template v-for="(message, key) in messages">
          <Message
            :key="key"
            :message="message"
            :parent-th-id="thread.parentThId"
            :get-thread="getThread"
          />
        </template>
      </ul>

      <ul v-if="isThread" class="col-3 list-group height-fixed scroll">
        <h4>{{ childThread.name }}</h4>
        <template v-for="(message, key) in childMessages">
          <Message
            :key="key"
            :message="message"
            :parent-th-id="childThread.parentThId"
            :get-thread="getThread"
          />
        </template>
      </ul>
    </div>

    <div class="row">
      <ul class="col-9 list-group">
        <form class="form-group">
          <textarea class="form-control float-left" rows="1" />
          <button
            type="button"
            class="btn text-primary float-right align-items-end"
          >
            <b-icon-cursor />
          </button>
        </form>
      </ul>

      <ul v-if="isThread" class="col-3 list-group">
        <form>
          <div class="form-group">
            <textarea class="form-control float-left" rows="1"></textarea>
          </div>
          <button
            type="button"
            class="btn text-primary float-right align-items-end"
          >
            <b-icon-cursor />
          </button>
        </form>
      </ul>
    </div>
  </div>
</template>

<script>
import { BIconSuitHeart, BIconSuitHeartFill, BIconCursor } from 'bootstrap-vue'
export default {
  components: {
    BIconSuitHeart,
    BIconSuitHeartFill,
    BIconCursor,
  },
  data: () => {
    const date = new Date().toDateString()
    return {
      registar: false,
      thread: {
        thId: 1,
        name: 'チャンネルの名前',
        abstract: 'このチャンネルの詳細',
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
    }
  },
  computed: {
    isThread() {
      return this.childThread !== null && this.childMessages !== null
    },
  },
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
