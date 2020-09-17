<template>
  <!-- <b-card-group deck>
    <b-card :title="event.title" header-tag="header" footer-tag="footer">
      <template v-slot:header>
        <h6 class="mb-0">イベント</h6>
      </template>
      <b-card-text>イベントの詳細</b-card-text>
      <b-button
        variant="primary"
        :to="{ name: 'event_list-id', params: { id: event.id } }"
        nuxt
        >Go somewhere</b-button
      >
      <template v-slot:footer>
        <em>{{ event.date.toDateString() }}</em>
      </template>
    </b-card>
  </b-card-group> -->
  <nuxt-link
    class="list-group-item list-group-item-action flex-column align-items-start"
    :to="{ name: 'event_list-id', params: { id: event.evId } }"
  >
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">{{ event.name }}</h5>
      <small>開催日:{{ event.datetime }}</small>
    </div>
    <p class="mb-1">
      {{ event.abstract }}
    </p>
    <table>
      <tr>
        <th>zoom</th>
        <td>{{ event.zoomUrl }}</td>
      </tr>
      <tr>
        <th>開催日</th>
        <td>{{ event.datetime }}</td>
      </tr>
      <tr>
        <th>募集期間</th>
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
