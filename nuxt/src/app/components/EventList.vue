<template>
  <b-card-body>
    <div class="row">
      <b-input-group size="sm" class="mb-2">
        <b-form-input
          v-model="keyword"
          type="search"
          placeholder="Search event"
        ></b-form-input>
        <b-input-group-prepend is-text>
          <b-button @click="searchEvent()">
            <b-icon-search />
          </b-button>
        </b-input-group-prepend>
      </b-input-group>
    </div>
    <div class="row justify-content-center height-fixed scroll">
      <template v-for="event in events">
        <EventItem :key="event.id" :event="event" />
      </template>
    </div>
  </b-card-body>
</template>

<script>
import { BIconSearch } from 'bootstrap-vue'
export default {
  components: {
    BIconSearch,
  },
  props: {
    events: {
      type: Array,
      default: () => [],
    },
    channelId: {
      id: 0,
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      keyword: '',
      eventSearchResult: [],
    }
  },
  computed: {
    eventsToShow() {
      return this.keyword === '' ? this.event : this.eventSearchResult
    },
  },
  methods: {
    async searchEvent() {
      this.eventSearchResult = await this.$axios
        .get('/api/events.json', {
          params: {
            channel_id: this.channelId,
            word: this.keyword,
          },
        })
        .then((res) => res.data.events)
    },
  },
}
</script>
