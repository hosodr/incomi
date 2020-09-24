<template>
  <form class="form-group mb-0">
    <div class="input-group mb-3">
      <textarea
        v-model="comment"
        class="form-control"
        placeholder="add comment"
      ></textarea>
      <div class="input-group-append">
        <button class="btn btn-outline-primary" type="button" @click="submit">
          <b-icon-cursor />
        </button>
      </div>
    </div>
  </form>
</template>

<script>
import { mapState } from 'vuex'
import { BIconCursor } from 'bootstrap-vue'
export default {
  components: {
    BIconCursor,
  },
  props: {
    channelId: { type: Number, default: null },
  },
  data: () => {
    return {
      comment: '',
    }
  },
  computed: {
    ...mapState({
      userId: (state) => state.userId,
    }),
  },
  methods: {
    submit() {
      const url = '/api/comments.json'
      const params = {
        user_id: this.userId,
        channel_id: this.channelId,
        message: this.comment,
      }
      const config = {
        headers: {
          'Content-Type': 'application/json',
        },
      }
      this.$axios
        .post(url, params, config)
        .then(() => {
          alert('Comment submit successfully')
          this.comment = ''
        })
        .catch(() => {
          alert('An error occured')
        })
    },
  },
}
</script>
