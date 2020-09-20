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
              <!-- <input
            class="col-10 form-control mr-sm-2"
            type="search"
            placeholder="Search"
            aria-label="Search"
          />
          <button
            class="col-2 btn btn-outline-success my-2 my-sm-0"
            type="submit"
          >
            Search
          </button> -->
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
      channels: [
        { id: 1, abstract: '初心者のための勉強会', name: '機械学習' },
        { id: 2, abstract: '初心者のための勉強会', name: 'Vue.js勉強会' },
        { id: 3, abstract: '初心者のための勉強会', name: 'rails 勉強会' },
        { id: 4, abstract: '初心者のための勉強会', name: 'react勉強会' },
        { id: 5, abstract: '初心者のための勉強会', name: 'html' },
        { id: 6, abstract: '初心者のための勉強会', name: 'css' },
        { id: 7, abstract: '初心者のための勉強会', name: '機械学習' },
        { id: 8, abstract: '初心者のための勉強会', name: 'Vue.js勉強会' },
        { id: 9, abstract: '初心者のための勉強会', name: 'rails 勉強会' },
        { id: 10, abstract: '初心者のための勉強会', name: 'react勉強会' },
        { id: 11, abstract: '初心者のための勉強会', name: 'html' },
        { id: 12, abstract: '初心者のための勉強会', name: 'css' },
      ],
    }
  },
}
</script>
