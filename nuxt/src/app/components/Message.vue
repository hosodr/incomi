<template>
  <!-- <li class="list-group-item">
    @[<span class="text-success">{{ message.date.toDateString() }} </span>]
    {{ message.message }}
  </li> -->
  <!-- <div>
    <b-card :sub-title="message.date.toDateString()">
      <b-card-text>
        {{ message.message }}
      </b-card-text>
      <nuxt-link
        class="my-0 text-primary float-left"
        :to="{
          name: 'thread_list-id',
          params: { id: message.id },
        }"
        >スレッドの表示</nuxt-link
      >
    </b-card>
  </div> -->
  <div class="card">
    <div class="card-body">
      <h6 class="card-subtitle mb-2 text-muted">
        {{ message.timestamp }}
      </h6>
      <p class="card-text">
        {{ message.msg }}
      </p>
      <button
        v-if="parentThId === null"
        button="button"
        class="btn my-0 text-primary float-right"
        @click="goThread"
      >
        返信
      </button>
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
