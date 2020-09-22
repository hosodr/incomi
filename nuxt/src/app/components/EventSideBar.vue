<template>
  <b-sidebar id="event-sidebar-backdrop" title="Events" right>
    <EventList :events="events" />
  </b-sidebar>
</template>

<script>
export default {
  props: {
    events: { type: Array, default: () => [] },
  },
  data() {
    return {}
  },
}
</script>
