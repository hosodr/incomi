<template>
  <div>
    <b-sidebar id="sidebar-backdrop" title="Sidebar with backdrop" right>
      <div class="px-3 py-2">
        <b-form-group label="Backdrop variant" label-for="backdrop-variant">
          <b-card-body>
            <div v-if="isThread">
              <div class="row">
                <ul v-if="isThread" class="col list-group height-fixed scroll">
                  <template v-for="(message, key) in childMessages">
                    <Message
                      :key="key"
                      :message="message"
                      :parent-th-id="childThread.parentThId"
                      :get-thread="getThread"
                      :show-thread="(isThread = true)"
                    />
                  </template>
                </ul>
              </div>
              <div class="row">
                <form class="col form-group mb-0">
                  <div class="input-group">
                    <textarea
                      class="form-control"
                      placeholder="add comment"
                    ></textarea>
                    <div class="input-group-append">
                      <button class="btn btn-outline-primary" type="button">
                        <b-icon-cursor />
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </div>

            <div v-else>
              <div class="row">
                <b-input-group size="sm" class="mb-2">
                  <b-form-input
                    type="search"
                    placeholder="Search event"
                  ></b-form-input>
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
            </div>
          </b-card-body>
        </b-form-group>
      </div>
    </b-sidebar>
  </div>
</template>

<script>
export default {
  data() {
    return {}
  },
}
</script>
