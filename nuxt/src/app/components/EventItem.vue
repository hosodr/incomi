<template>
  <nuxt-link
    class="list-group-item list-group-item-action flex-column align-items-start"
    :to="{ name: 'event_list-id', params: { id: event.evId } }"
  >
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">{{ event.name }}</h5>
    </div>
    <p class="mb-1">
      {{ event.abstract }}
    </p>
    <table>
      <tr>
        <th>zoom:</th>
        <td>{{ event.zoomUrl }}</td>
      </tr>
      <tr>
        <th>host date:</th>
        <td>{{ event.datetime }}</td>
      </tr>
      <tr>
        <th>dead line:</th>
        <td>{{ event.from }}〜{{ event.to }}</td>
      </tr>
    </table>
  </nuxt-link>
</template>

<script>
export default {
  props: ['event'],
  methods: {},
}
</script>
