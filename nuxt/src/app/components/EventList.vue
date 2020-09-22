<template>
  <b-card-body>
    <div class="row">
      <b-input-group size="sm" class="mb-2">
        <b-form-input type="search" placeholder="Search event"></b-form-input>
        <b-input-group-prepend is-text>
          <b-icon-search />
        </b-input-group-prepend>
      </b-input-group>
    </div>
    <div class="row justify-content-center height-fixed scroll">
      <template v-for="event in events">
        <EventItem :key="event.id" :event="event" />
      </template>
    </div>
  </b-card-body>
</template>

<script>
import { BIconSearch } from 'bootstrap-vue'
export default {
  components: {
    BIconSearch,
  },
  props: {
    events: {
      type: Array,
      default: () => [],
    },
  },
}
</script>
