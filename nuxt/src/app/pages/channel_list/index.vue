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

              <CreateChannelModal />
            </div>
          </div>
        </div>

        <div class="row list-group">
          <template v-for="channel in channels">
            <ChannelItem :key="channel.channel.channelId" :channel="channel" />
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
    this.channels = this.$getChannels()
  },
  methods: {},
}
</script>
