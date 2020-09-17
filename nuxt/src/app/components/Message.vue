<template>
  <div class="card border-right-0 border-left-0">
    <div class="card-body my-0">
      <h6 class="card-subtitle text-muted">
        {{ message.timestamp }}
      </h6>
      <div class="row">
        <div class="col-10 pr-0">
          <p class="card-text">
            {{ message.msg }}
          </p>
        </div>
        <div class="col-2 px-0">
          <button
            v-if="parentThId === null"
            type="button"
            class="btn my-0 text-primary float-right"
            @click="goThread"
          >
            返信
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: { message: Object, parentThId: Number, getThread: Function },
  data: () => {
    return {}
  },
  methods: {
    goThread() {
      this.getThread(this.parentThId, this.message.cmId)
    },
  },
}
</script>
