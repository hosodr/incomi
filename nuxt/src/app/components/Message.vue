<template>
  <div v-if="message !== null" class="card border-right-0 border-left-0">
    <div class="card-body py-3">
      <h6 class="card-subtitle text-muted" style="font-size: 14px">
        {{ date }} {{ time }}
      </h6>
      <div class="row">
        <div class="col pr-0 mb-1">
          <autolink class="card-text" :text="message.message" />
        </div>
      </div>
      <div class="row">
        <div class="col pr-0">
          <a
            v-if="repliable === true"
            class="my-0 float-right d-none d-sm-block"
            @click="goThread"
          >
            {{ message.num_of_comments }}reply
          </a>
          <a
            v-if="repliable === true"
            v-b-toggle.thread-sidebar-backdrop
            class="my-0 float-right d-sm-none"
            @click="goThread"
          >
            {{ message.num_of_comments }}reply
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    message: { type: Object, required: true },
    getThread: {
      type: Function,
      default: () => () => {},
    },
    showThread: {
      type: Function,
      default: () => () => {},
    },
    setRootMessage: {
      type: Function,
      default: () => () => {},
    },
    repliable: {
      type: Boolean,
      default: true,
    },
  },
  data: () => {
    return {}
  },
  computed: {
    date() {
      return this.message.created_at.split('T')[0]
    },
    time() {
      return this.message.created_at.split('T')[1].split('.')[0]
    },
  },
  mounted() {
    // console.log('commentid', this.message.id)
    // console.log('channel id', this.message.channel_id)
    // console.log('child id', this.message.child_channel_id)
  },
  methods: {
    goThread() {
      this.setRootMessage(this.message)
      this.getThread(this.message.child_channel_id)
      this.showThread()
    },
  },
}
</script>
