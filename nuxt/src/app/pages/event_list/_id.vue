<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-10">
        <div class="card mt-5">
          <div class="card-header">
            <div class="row mt-3">
              <b-alert
                :show="dismissCountDown"
                dismissible
                variant="danger"
                @dismissed="dismissCountDown = 0"
                @dismiss-count-down="countDownChanged"
              >
                Error joining this event
              </b-alert>
            </div>
            <div class="row">
              <h5 class="col-md-7 mb-0 d-flex align-items-center">
                {{ event.name }}
              </h5>
              <div class="col-md-5">
                <template v-if="false">
                  <nuxt-link class="my-0 text-danger" to="id/edit"
                    >Delete</nuxt-link
                  >
                  <nuxt-link class="my-0 mr-5" to="id/edit">Modify</nuxt-link>
                </template>
                <template v-else>
                  <div
                    v-if="!join"
                    type="button"
                    class="btn btn-sm btn-default border-dark rounded"
                    @click="toggleJoin()"
                  >
                    <b-icon-person-check />
                    Attend
                  </div>
                  <div
                    v-else
                    type="button"
                    class="btn btn-sm btn-primary"
                    @click="toggleJoin()"
                  >
                    <b-icon-person />
                    Attending
                  </div>
                </template>
              </div>
            </div>
          </div>
          <div class="card-body">
            <p class="card-text">
              {{ event.abstract }}
            </p>
            <table class="table">
              <tr>
                <th>Date:</th>
                <td class="text-break">{{ event.host_date | formatTime }}</td>
              </tr>
              <tr>
                <th>Registration Period:</th>
                <td class="text-break">
                  {{ event.from_date | formatTime }}~{{
                    event.to_date | formatTime
                  }}
                </td>
              </tr>
              <tr>
                <th>Zoom URL:</th>
                <td class="text-break">
                  <autolink :text="event.zoom_url" />
                </td>
              </tr>
            </table>
          </div>
          <nuxt-link
            :to="{ name: 'channel_list-id', params: { id: event.channel_id } }"
            >Channel</nuxt-link
          >
        </div>

        <!-- <div class="card mt-2">
          <div class="card-header">Discussion Thread</div>
          <ul class="list-group">
            <template v-for="(message, key) in messages">
              <Message
                :key="key"
                :message="message"
                :parent-th-id="3"
                :get-thread="() => {}"
                :show-thread="null"
              />
            </template>
          </ul>
        </div> -->
      </div>
    </div>
  </div>
</template>

<script>
// Owner: Sato
// Karakate contributed to the JS part of this file (not owner)
import { BIconPersonCheck, BIconPerson } from 'bootstrap-vue'
export default {
  components: {
    BIconPersonCheck,
    BIconPerson,
  },
  filters: {
    formatTime(time) {
      return time.split('.')[0].replace('T', ' ')
    },
  },
  async fetch() {
    this.event = await this.$axios
      .get('/api/events/' + this.$route.params.id + '.json')
      .then((res) => res.data)
  },
  data: () => {
    // const date = new Date().toDateString()
    return {
      dismissCountDown: 0,
      join: false,
      event: {},
    }
  },
  methods: {
    async toggleJoin() {
      try {
        await this.$axios.post(
          '/api/events/' + this.$route.params.id + '/participate/1'
        )
        this.join = !this.join
      } catch {
        this.dismissCountDown = 5
      }
    },
    countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },
  },
}
</script>
