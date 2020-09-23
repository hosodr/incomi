<template>
  <nuxt-link
    class="list-group-item list-group-item-action flex-column align-items-start"
    :to="{ name: 'event_list-id', params: { id: event.id } }"
  >
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">{{ event.name }}</h5>
    </div>
    <p class="mb-0" style="font-size: 14px">
      {{ event.abstract }}
    </p>
    <table>
      <tr>
        <th>Zoom URL:</th>
        <td>{{ event.zoom_url }}</td>
      </tr>
      <tr>
        <th>Date:</th>
        <td>{{ event.host_date }}</td>
      </tr>
      <tr>
        <th>Registration Period:</th>
        <td>{{ event.from_date }}〜{{ event.to_date }}</td>
      </tr>
    </table>
  </nuxt-link>
</template>

<script>
export default {
  props: {
    event: {
      id: 0,
      type: Object,
      required: true,
    },
  },
  mounted() {},
}
</script>
