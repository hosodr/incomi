<template>
  <ul v-if="messages" ref="messages" class="list-group">
    <template v-for="(message, key) in messages">
      <Message
        :key="key"
        :message="message"
        :show-thread="showThread"
        :get-thread="getThread"
        :thread-id="message.childThread.channelId"
      />
    </template>
  </ul>
</template>

<script>
export default {
  props: {
    messages: {
      type: Array,
      required: true,
    },
    showThread: {
      type: Function,
      default: () => () => {},
    },
    getThread: {
      type: Function,
      default: () => () => {},
    },
    threadId: { type: Number, default: null },
  },
  mounted() {
    this.$nextTick(() => {
      this.$refs.messages.scrollIntoView(false)
    })
  },
}
</script>
