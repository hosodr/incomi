<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-10">
        <div class="card mt-5">
          <div class="card-header">
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
                    @click="join = !join"
                  >
                    <b-icon-person-check />
                    Attend
                  </div>
                  <div
                    v-else
                    type="button"
                    class="btn btn-sm btn-primary"
                    @click="join = !join"
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
            <table>
              <tr>
                <th>Date:</th>
                <td>{{ event.host_date }}</td>
              </tr>
              <tr>
                <th>Registration Period:</th>
                <td>{{ event.from_date }}~{{ event.to_date }}</td>
              </tr>
              <tr>
                <th>Zoom URL:</th>
                <td>
                  <a :href="event.zoomUrl">{{ event.zoom_url }}</a>
                </td>
              </tr>
            </table>
          </div>
          <nuxt-link
            :to="{ name: 'channel_list-id', params: { id: event.channel_id } }"
            >Channel</nuxt-link
          >
        </div>

        <div class="card mt-2">
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
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { BIconPersonCheck, BIconPerson } from 'bootstrap-vue'
export default {
  components: {
    BIconPersonCheck,
    BIconPerson,
  },
  async fetch() {
    this.event = await fetch(
      '/api/events/' + this.$route.params.id
    ).then((res) => res.json())
  },
  data: () => {
    const date = new Date().toDateString()
    return {
      join: false,
      event: {
        name: 'Basic ML',
        abstract:
          "We'll study ML, machine kearning. In paticular, we forcus on reinforcement learning.",
        host_date: new Date().toTimeString(),
        from_date: new Date().toDateString(),
        to_date: new Date().toDateString(),
        zoom_url: 'zoom.url',
        channel_id: '2',
      },
      messages: [
        { msg: '何しようか', cmId: 1, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 2, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 3, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 4, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 5, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 1, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 2, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 3, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 4, timestamp: date, userId: 1 },
        { msg: '何しようか', cmId: 5, timestamp: date, userId: 1 },
      ],
    }
  },
  methods: {},
}
</script>
