<template>
  <form class="form-group mb-0">
    <div class="input-group mb-3">
      <textarea class="form-control" placeholder="add comment"></textarea>
      <div class="input-group-append">
        <button class="btn btn-outline-primary" type="button">
          <b-icon-cursor />
        </button>
      </div>
    </div>
  </form>
</template>

<script>
import { BIconCursor } from 'bootstrap-vue'
export default {
  components: {
    BIconCursor,
  },
  props: {
    channelId: { type: Number, default: null },
  },
}
</script>
