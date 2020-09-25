<template>
  <b-sidebar id="event-sidebar-backdrop" title="Events" right>
    <EventList :events="events" :channel-id="channelId" />
  </b-sidebar>
</template>

<script>
export default {
  props: {
    events: { type: Array, default: () => [] },
    channelId: {
      id: 0,
      type: Number,
      required: true,
    },
  },
  data() {
    return {}
  },
}
</script>
