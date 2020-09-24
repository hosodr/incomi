<template>
  <b-sidebar v-if="messages" id="thread-sidebar-backdrop" title="Thread" right>
    <Message
      :message="rootMessage"
      :repliable="false"
      :set-root-message="setRootMessage"
    />
    <p class="text-muted m-0 text-center">{{ messages.length }} replies</p>
    <MessageList
      :messages="messages"
      :repliable="false"
      :set-root-message="setRootMessage"
    />
    <SubmitBar
      :channel-id="rootMessage.child_channel_id"
      :reload-comments="reloadComments"
    />
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
    reloadComments: {
      type: Function,
      required: true,
    },
    setRootMessage: {
      type: Function,
      required: true,
    },
  },
  data() {
    return {}
  },
}
</script>
