<template>
  <b-sidebar v-if="messages" id="thread-sidebar-backdrop" title="Thread" right>
    <Message :message="rootMessage" :repliable="false" />
    <p class="text-muted m-0 text-center">{{ messages.length }} replies</p>
    <MessageList :messages="messages" :repliable="false" />
    <SubmitBar
      :channel-id="threadId"
      :parent-channel-id="parentChannelId"
      :parent-comment-id="parentCommentId"
      :get-thread-comments="getThreadComments"
      :get-channel-comments="getChannelComments"
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
    parentChannelId: {
      type: Number,
      default: null,
    },
    parentCommentId: {
      type: Number,
      default: null,
    },
    rootMessage: {
      type: Object,
      default: () => {},
    },
    getChannelComments: {
      type: Function,
      required: true,
    },
    getThreadComments: {
      type: Function,
      required: true,
    },
    setRootMessage: {
      type: Function,
      default: () => () => {},
    },
  },
  data() {
    return {}
  },
}
</script>
