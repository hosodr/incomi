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
                    >delete</nuxt-link
                  >
                  <nuxt-link class="my-0 mr-5" to="id/edit">modify</nuxt-link>
                </template>
                <template v-else>
                  <div
                    v-if="!join"
                    type="button"
                    class="btn btn-sm btn-default border-dark rounded"
                    @click="join = !join"
                  >
                    <b-icon-person-check />
                    attend
                  </div>
                  <div
                    v-else
                    type="button"
                    class="btn btn-sm btn-primary"
                    @click="join = !join"
                  >
                    <b-icon-person />
                    attending
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
                <th>host date:</th>
                <td>{{ event.hostDate }}</td>
              </tr>
              <tr>
                <th>dead line:</th>
                <td>~{{ event.to }}</td>
              </tr>
              <tr>
                <th>zoom url:</th>
                <td>
                  <a :href="event.zoomUrl">{{ event.zoomUrl }}</a>
                </td>
              </tr>
            </table>
          </div>
          <nuxt-link to="/channel_list/1">チャンネルに移動</nuxt-link>
        </div>

        <div class="card mt-2">
          <div class="card-header">スレッド</div>
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
  data: () => {
    const date = new Date().toDateString()
    return {
      join: false,
      event: {
        name: 'stydy about ML',
        abstract:
          "We'll stydy ML, machine kearning. In paticular, we forcus on reinforcement learning.",
        hostDate: new Date().toTimeString(),
        from: new Date().toDateString(),
        to: new Date().toDateString(),
        zoomUrl: 'zoom.url',
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
