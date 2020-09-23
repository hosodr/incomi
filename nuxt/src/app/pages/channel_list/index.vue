<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-9">
        <div class="row my-3">
          <h1>Channels</h1>
        </div>
        <div class="row justify-content-between mb-2">
          <form class="col form-group my-0">
            <div class="row justify-content-start input-group">
              <input
                class="form-control"
                type="search"
                placeholder="Search"
                aria-label="Search"
              />
              <div class="input-group-append">
                <button class="btn btn-outline-success" type="submit">
                  Search
                </button>
              </div>
            </div>
          </form>
          <div class="col">
            <div class="row justify-content-end">
              <b-button v-b-modal.create-channel variant="primary" class=""
                >create a channel</b-button
              >
              <b-modal
                id="create-channel"
                size="lg"
                title="Create a new channel"
                ><CreateChannelModal
              /></b-modal>
            </div>
          </div>
        </div>

        <div class="row list-group">
          <template v-for="channel in channels">
            <ChannelItem :key="channel.id" :channel="channel" />
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      channels: null,
    }
  },
  created() {
    this.getChannels()
  },
  methods: {
    async getChannels() {
      const tmp = await fetch('/api/channels').then((res) => res.json())
      const channels = tmp.channels
      for (let i = 0; i < channels.length; i++) {
        channels[i].numOfComments = channels[i].num_of_comments
        channels[i].numOfEvents = channels[i].num_of_events
      }
      this.channels = channels
    },
  },
}
</script>
