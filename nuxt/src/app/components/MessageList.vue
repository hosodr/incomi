<template>
  <ul v-if="messages !== null" ref="messages" class="list-group">
    <template v-for="(message, key) in messages">
      <Message
        :key="key"
        :message="message"
        :show-thread="showThread"
        :get-thread="getThread"
        :repliable="repliable"
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
    repliable: {
      type: Boolean,
      default: true,
    },
  },
  mounted() {
    this.$nextTick(() => {
      this.$refs.messages.scrollIntoView(false)
    })
  },
}
</script>
