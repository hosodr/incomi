<template>
  <b-sidebar v-if="messages" id="thread-sidebar-backdrop" title="Thread" right>
    <Message :message="rootMessage" :repliable="false" />
    <p class="text-muted m-0 text-center">{{ messages.length }} replies</p>
    <MessageList :messages="messages" :repliable="false" />
    <SubmitBar :channel-id="rootMessage.child_channel_id" />
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
