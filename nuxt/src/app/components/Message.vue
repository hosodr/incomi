<template>
  <div class="card border-right-0 border-left-0">
    <div class="card-body my-0">
      <h6 class="card-subtitle text-muted" style="font-size: 14px">
        {{ message.timestamp }}
      </h6>
      <div class="row">
        <div class="col-10 pr-0">
          <autolink class="card-text" :text="message.msg" />
        </div>
        <div class="col-2 px-0">
          <a
            v-if="parentThId === null"
            class="my-0 float-right"
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
    message: Object,
    parentThId: Number,
    getThread: Function,
    showThread: Function,
  },
  data: () => {
    return {}
  },
  methods: {
    goThread() {
      this.getThread(this.parentThId, this.message.cmId)
      this.showThread()
    },
  },
}
</script>
