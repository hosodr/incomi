<template>
  <b-sidebar v-if="messages" id="thread-sidebar-backdrop" title="Thread" right>
    <Message :message="rootMessage" />
    <p class="text-muted m-0 text-center">3件の返信</p>
    <MessageList :messages="messages" :thread-id="threadId" />
    <SubmitBar :channel-id="threadId" />
  </b-sidebar>
</template>

<script>
export default {
  props: {
    messages: {
      type: Array,
      default: () => [],
    },
    threadId: {
      type: Number,
      default: null,
    },
    rootMessage: {
      type: Object,
      default: () => {},
    },
  },
  data() {
    return {}
  },
}
</script>
