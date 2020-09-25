<template>
  <form class="form-group mb-0">
    <div class="input-group mb-3">
      <textarea
        v-model="comment"
        class="form-control"
        placeholder="add comment"
      ></textarea>
      <div class="input-group-append">
        <button
          class="btn btn-primary"
          type="button"
          :disabled="comment === ''"
          @click="submit"
        >
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
    parentChannelId: {
      type: Number,
      default: null,
    },
    parentCommentId: {
      type: Number,
      default: null,
    },
    getChannelComments: {
      type: Function,
      default: () => () => {},
    },
    getThreadComments: {
      type: Function,
      default: () => () => {},
    },
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
  mounted() {},
  methods: {
    async submit() {
      if (this.channelId === null) {
        await this.createThread()
      }
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
        .then((res) => {
          if (this.parentChannelId !== null) {
            this.getThreadComments(this.channelId)
            this.getChannelComments(this.parentChannelId)
          } else {
            this.getChannelComments(this.channelId)
          }
          this.comment = ''
        })
        .catch(() => {
          alert('An error occured submit')
        })
    },
    async createThread() {
      const url = '/api/channels.json'
      const params = {
        name: '',
        abstract: '',
        parent_channel_id: this.parentChannelId,
        parent_comment_id: this.parentCommentId,
      }
      const config = {
        headers: {
          'Content-Type': 'application/json',
        },
      }
      this.channelId = await this.$axios
        .post(url, params, config)
        .then((res) => res.data.id)
        .catch(() => {
          alert('An error occured create')
        })
    },
  },
}
</script>
