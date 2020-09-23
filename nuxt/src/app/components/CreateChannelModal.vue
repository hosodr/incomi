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
          <label class="col-lg-2 col-form-label" for="channelDescription">
            Description
          </label>
          <div class="col-lg-10">
            <input
              id="channelDescription"
              v-model="channelDescription"
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
      channelDescription: '',
    }
  },
  computed: {
    ...mapState({
      userId: (state) => state.userId,
    }),
  },
  methods: {
    submit() {
      const form = new FormData()
      form.set('', this.userId)
      this.$axios
        .post('', form)
        .then(() => {})
        .catch(() => {})
    },
  },
}
</script>
