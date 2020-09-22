<template>
  <div class="card border-right-0 border-left-0">
    <div class="card-body py-3">
      <h6 class="card-subtitle text-muted" style="font-size: 14px">
        {{ message.timestamp }}
      </h6>
      <div class="row">
        <div class="col pr-0 mb-1">
          <autolink class="card-text" :text="message.message" />
        </div>
      </div>
      <div class="row">
        <div class="col pr-0">
          <a
            v-if="threadId !== null"
            class="my-0 float-right d-none d-sm-block"
            @click="goThread"
          >
            reply
          </a>
          <a
            v-if="threadId !== null"
            v-b-toggle.thread-sidebar-backdrop
            class="my-0 float-right d-sm-none"
            @click="goThread"
          >
            reply
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
    threadId: {
      type: Number,
      default: null,
    },
    getThread: {
      type: Function,
      default: () => () => {},
    },
    showThread: {
      type: Function,
      default: () => () => {},
    },
  },
  data: () => {
    return {}
  },
  mounted() {},
  methods: {
    goThread() {
      this.getThread(this.threadId, this.message)
      this.showThread()
    },
  },
}
</script>
