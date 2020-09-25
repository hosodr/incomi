<template>
  <nuxt-link
    class="list-group-item list-group-item-action flex-column align-items-start mb-1"
    :to="{ name: 'event_list-id', params: { id: event.id } }"
  >
    <div class="d-flex w-100 justify-content-between">
      <h4 class="mb-1">{{ event.name }}</h4>
    </div>
    <p class="mb-0">
      {{ event.abstract }}
    </p>
    <table>
      <tr>
        <th class="text-muted">Date:</th>
        <td class="text-break text-muted">
          {{ event.host_date | formatTime }}
        </td>
      </tr>
    </table>
  </nuxt-link>
</template>

<script>
export default {
  filters: {
    formatTime(time) {
      return time.split('.')[0].replace('T', ' ')
    },
  },
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

<style scoped>
td {
}
</style>
