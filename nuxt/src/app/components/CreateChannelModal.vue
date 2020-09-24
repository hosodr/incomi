<template>
  <b-modal
    id="create-channel"
    size="lg"
    title="Create a new channel"
    @ok="submit"
  >
    <div class="container">
      <form>
        <div class="form-group row">
          <label class="col-lg-2 col-form-label" for="channelName">
            Channel Name
          </label>
          <div class="col-lg-10">
            <input
              id="channelName"
              v-model="channelName"
              type="text"
              class="form-control"
              placeholder="a cool name for your channel"
            />
          </div>
        </div>
        <div class="form-group row">
          <label class="col-lg-2 col-form-label" for="channelAbstract">
            Description
          </label>
          <div class="col-lg-10">
            <input
              id="channelAbstract"
              v-model="channelAbstract"
              type="text"
              class="form-control"
              placeholder="a short description for your channel"
            />
          </div>
        </div>
      </form>
    </div>
  </b-modal>
</template>

<script>
import { mapState } from 'vuex'
export default {
  props: {},
  data: () => {
    return {
      channelName: '',
      channelAbstract: '',
    }
  },
  computed: {
    ...mapState({
      userId: (state) => state.userId,
    }),
  },
  methods: {
    submit() {
      const url = '/channels'
      const params = {
        name: this.channelName,
        abstract: this.channelAbstract,
        parent_channel_id: 1,
        parent_comment_id: 1,
      }
      const config = {
        headers: {
          'Content-Type': 'application:json',
        },
      }

      this.$axios
        .post(url, params, config)
        .then(() => {
          alert('ok')
        })
        .catch(() => {
          alert('An error occured')
        })
      this.clearInputForm()
    },
    clearInputForm() {
      this.channelName = ''
      this.channelAbstract = ''
    },
  },
}
</script>
