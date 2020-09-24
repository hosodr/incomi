<template>
  <div class="container">
    <ThreadSideBar :messages="threadComments" :root-message="rootMessage" />
    <EventSideBar :events="events" />
    <b-modal
      id="create-event"
      size="lg"
      title="Create a new event"
      @ok="afterCreateEvent()"
      ><CreateEventModal
        ref="createEventModal"
        :channel-id="channelId"
        :host-user-id="hostUserId"
    /></b-modal>
    <div class="row mt-3">
      <b-alert
        :show="dismissCountDown"
        dismissible
        variant="danger"
        @dismissed="dismissCountDown = 0"
        @dismiss-count-down="countDownChanged"
      >
        Error creating a new event
      </b-alert>
    </div>
    <div class="row mt-3">
      <div class="col-md-8">
        <div class="row card-header pb-0">
          <div class="col">
            <div class="row">
              <div class="col-md-6">
                <h4 class="row">
                  <b-icon-chat-right-text />
                  {{ channelName }}
                </h4>
              </div>

              <div class="col-md-6 px-0">
                <button
                  v-if="addMyChannel"
                  id="is-favorite"
                  type="button"
                  class="btn btn-primary btn-sm"
                  @click="addMyChannel = !addMyChannel"
                >
                  following
                </button>
                <button
                  v-else
                  id="not-favorite"
                  type="button"
                  class="btn btn-default btn-sm border-dark rounded"
                  @click="addMyChannel = !addMyChannel"
                >
                  follow
                </button>

                <button
                  v-b-modal.create-event
                  type="button"
                  class="btn btn-sm btn-outline-secondary"
                >
                  create event
                </button>

                <button
                  v-b-toggle.event-sidebar-backdrop
                  type="button"
                  class="d-sm-none btn btn-sm btn-outline-secondary"
                >
                  show events
                </button>
              </div>
            </div>

            <!-- <b-popover
              target="is-favorite"
              :show.sync="addMyChannel"
              triggers="click"
              placement="top"
            >
              <strong>add your channel list!</strong>
            </b-popover> -->

            <div class="row">
              <p class="mb-0">{{ channelAbstract }}</p>
            </div>

            <div class="row">
              <p class="mr-1 mb-0 text-muted" style="font-size: 8">
                <b-icon-people />{{ followingUsers.length }} followers
              </p>
              <p class="mr-1 mb-0 text-muted" style="font-size: 8">
                <b-icon-chat-dots />{{ channelComments.length }} comments
              </p>
              <p class="mr-1 mb-0 text-muted" style="font-size: 8">
                <b-icon-calendar-2-event />{{ events.length }} events
              </p>
            </div>
          </div>
        </div>

        <div class="row height-fixed scroll">
          <div class="col">
            <MessageList
              :messages="channelComments"
              :get-thread="getThreadInfo"
              :show-thread="showThread"
            />
          </div>
        </div>
        <div class="row">
          <div class="col">
            <SubmitBar :channel-id="channelId" />
          </div>
        </div>
      </div>

      <div class="col-md-4 d-none d-sm-block">
        <b-card title="Card Title" no-body>
          <b-card-header header-tag="nav">
            <b-nav card-header tabs>
              <b-nav-item :active="isThread" @click="showThread"
                >Thread</b-nav-item
              >
              <b-nav-item :active="!isThread" @click="isThread = false"
                >Events</b-nav-item
              >
            </b-nav>
          </b-card-header>

          <b-card-body>
            <div v-if="isThread && threadComments">
              <div class="row height-fixed scroll">
                <div class="col">
                  <Message
                    v-if="rootMessage"
                    :message="rootMessage"
                    :repliable="false"
                  />
                  <p class="text-muted m-0 text-center">
                    {{ threadComments.length }} replies
                  </p>
                  <MessageList :messages="threadComments" :repliable="false" />
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <SubmitBar :channel-id="channelId" />
                </div>
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
                  <EventItem
                    :key="event.id"
                    :event="event"
                    :channel-id="channelId"
                  />
                </template>
              </div>
            </div>
          </b-card-body>
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
import {
  BIconSearch,
  BIconCalendar2Event,
  BIconChatRightText,
  BIconPeople,
  BIconChatDots,
} from 'bootstrap-vue'
export default {
  components: {
    BIconSearch,
    BIconCalendar2Event,
    BIconChatRightText,
    BIconPeople,
    BIconChatDots,
  },
  data: () => {
    return {
      addMyChannel: false,
      isThread: false,
      rootMessage: null,
      followingUsers: [],
      hostUserId: '',
      channelName: '',
      channelAbstract: '',
      channelComments: [],
      threadComments: [],
      threadId: null,
      events: [],
      newEventCreated: 0,
      dismissCountDown: 0,
    }
  },
  computed: {
    channelId() {
      return parseInt(this.$route.params.id, 10)
    },
  },
  created() {
    this.getChannelInfo(this.channelId)
    this.getChannelComments(this.channelId)
    this.getEventInfo(this.channelId)
  },
  methods: {
    getThreadInfo(threadId, rootMessage) {
      // スレッドの情報を取得
      const url = `/api/comments/channel/${threadId}.json`
      this.$axios.get(url).then((res) => {
        this.threadComments = res.data.comments
        console.log('thread', this.threadComments)
      })
      this.rootMessage = rootMessage
    },
    showThread() {
      if (this.threadComments) {
        this.isThread = true
      }
    },
    countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown
      this.newEventCreated = 0
    },
    afterCreateEvent() {
      if (this.$refs.createEventModal.submit()) {
        this.newEventCreated = 1
        this.dismissCountDown = 5
      } else {
        this.newEventCreated = 2
        this.dismissCountDown = 5
      }
    },
    getChannelInfo(channelId) {
      // チャンネルの詳細情報を取得する
      const url = `/api/channels/${channelId}.json`
      this.$axios.get(url).then((res) => {
        const data = res.data
        this.channelAbstract = data.channelAbstract
        this.channelName = data.name
      })
    },
    getChannelComments(channelId) {
      // チャンネルに紐ついたコメントを取得する
      const url = `/api/comments/channel/${channelId}.json`
      this.$axios.get(url).then((res) => {
        const data = res.data.comments
        this.channelComments = data
        // channel_id: 1
        // child_channel_id: null
        // id: 1
        // message: null
        // num_of_comments: null
        // user_id: 1
      })
    },
    async getEventInfo(channelId) {
      this.events = await this.$axios
        .get('/api/events.json?channel_id=' + channelId)
        .then((res) => res.data.events)
    },
  },
}
</script>

<style scoped>
.scroll {
  overflow-y: auto;
}

.height-fixed {
  height: 70vh;
}
</style>
