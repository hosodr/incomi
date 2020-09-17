<template>
  <nuxt-link
    class="list-group-item list-group-item-action flex-column align-items-start"
    :to="{ name: 'channel_list-id', params: { id: channel.id } }"
  >
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">{{ channel.name }}</h5>
    </div>
    <p class="mb-1">
      {{ channel.abstract }}
    </p>
  </nuxt-link>
</template>

<script>
export default {
  props: { channel: Object },
  methods: {},
}
</script>
