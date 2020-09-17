<template>
  <div class="container">
    <div class="row justify-content-center">
      <button
        v-if="registar"
        type="button"
        class="btn btn-primary"
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

    <div class="row justify-content-center">
      <ul class="col-9 list-group col">
        <h1>{{ thread.name }}</h1>
        <template v-for="(message, key) in messages">
          <Message
            :key="key"
            :message="message"
            :parent-th-id="thread.parentThId"
            :get-thread="getThread"
          />
        </template>
        <form>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">Example textarea</label>
            <textarea class="form-control" rows="3"></textarea>
          </div>
          <button type="button" class="btn btn-primary">送信</button>
        </form>
      </ul>

      <ul v-if="isThread" class="col-3 list-group col">
        <h4>{{ childThread.name }}</h4>
        <template v-for="(message, key) in childMessages">
          <Message
            :key="key"
            :message="message"
            :parent-th-id="childThread.parentThId"
            :get-thread="getThread"
          />
        </template>
        <form>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">Example textarea</label>
            <textarea class="form-control" rows="3"></textarea>
          </div>
          <button type="button" class="btn btn-primary">送信</button>
        </form>
      </ul>
    </div>
  </div>
</template>

<script>
import { BIconSuitHeart, BIconSuitHeartFill } from 'bootstrap-vue'
export default {
  components: {
    BIconSuitHeart,
    BIconSuitHeartFill,
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
      ]
      this.childThread = thread
      this.childMessages = message
    },
    hoge() {
      console.log(this.childMessages, this.childThread)
    },
  },
}
</script>

<style scoped>
.scroll {
  overflow-y: auto;
}

.height-fixed {
  height: 95vh;
}
</style>
