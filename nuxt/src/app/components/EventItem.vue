<template>
  <nuxt-link
    class="list-group-item list-group-item-action flex-column align-items-start"
    :to="{ name: 'event_list-id', params: { id: event.eventId } }"
  >
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">{{ event.eventName }}</h5>
    </div>
    <p class="mb-0" style="font-size: 14px">
      {{ event.eventAbstract }}
    </p>
    <table>
      <tr>
        <th>zoom:</th>
        <td>{{ event.zoomUrl }}</td>
      </tr>
      <tr>
        <th>host date:</th>
        <td>{{ event.hostDate }}</td>
      </tr>
      <tr>
        <th>dead line:</th>
        <td>{{ event.fromDate }}〜{{ event.toDate }}</td>
      </tr>
    </table>
  </nuxt-link>
</template>

<script>
export default {
  props: {
    event: {
      type: Object,
      required: true,
    },
  },
  mounted() {},
}
</script>
