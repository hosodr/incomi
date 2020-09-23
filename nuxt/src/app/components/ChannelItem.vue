<template>
  <nuxt-link
    class="list-group-item list-group-item-action flex-column align-items-start"
    :to="{ name: 'channel_list-id', params: { id: channel.channel.channelId } }"
  >
    <div class="row">
      <div class="col-10">
        <h5 class="mb-1">{{ channel.channel.channelName }}</h5>
        <p class="mb-1">
          {{ channel.channel.channelAbstract }}
        </p>
      </div>
      <div class="col-2 px-0">
        <p class="d-inline-block mr-1 mb-0 text-muted" style="font-size: 8">
          <b-icon-chat-dots />{{ channel.numOfComments }}
        </p>
        <p class="d-inline-block mr-1 mb-0 text-muted" style="font-size: 8">
          <b-icon-calendar-2-event />{{ channel.numOfEvents }}
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
  props: { channel: { type: Object, required: true } },
  mounted() {},
  methods: {},
}
</script>
