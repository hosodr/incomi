<template>
  <nuxt-link
    class="list-group-item list-group-item-action flex-column align-items-start"
    :to="{ name: 'channel_list-id', params: { id: channel.id } }"
  >
    <div class="row">
      <div class="col-10">
        <h5 class="mb-1">{{ channel.name }}</h5>
        <p class="mb-1">
          {{ channel.abstract }}
        </p>
      </div>
      <div class="col-2 px-0">
        <p class="d-inline-block mr-1 mb-0 text-muted" style="font-size: 8">
          <b-icon-chat-dots />10
        </p>
        <p class="d-inline-block mr-1 mb-0 text-muted" style="font-size: 8">
          <b-icon-calendar-2-event />10
        </p>
      </div>
    </div>
  </nuxt-link>
</template>

<script>
import { BIconCalendar2Event, BIconChatDots } from 'bootstrap-vue'
export default {
  components: {
    BIconCalendar2Event,
    BIconChatDots,
  },
  props: { channel: Object },
  methods: {},
}
</script>
