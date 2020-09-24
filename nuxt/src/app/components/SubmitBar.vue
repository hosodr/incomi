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
    parentChannelId: {
      type: Number,
      default: null,
    },
    parentCommentId: {
      type: Number,
      default: null,
    },
    reloadComments: {
      type: Function,
      required: true,
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
  methods: {
    submit() {
      if (this.channelId === null) {
        this.createChannel()
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
          this.reloadComments(this.channelId)
          this.comment = ''
        })
        .catch(() => {
          alert('An error occured')
        })
    },
  },
  createChannel() {
    const url = '/api/channels.json'
    const params = {
      name: '',
      abstract: 'fuga',
      parent_channel_id: this.parentChannelId,
      parent_comment_id: this.parentCommentId,
    }
    const config = {
      headers: {
        'Content-Type': 'application/json',
      },
    }
    this.$axios
      .post(url, params, config)
      .then((res) => {
        console.log(res)
        // this.channelId = res
      })
      .catch(() => {
        alert('An error occured')
      })
  },
}
</script>
