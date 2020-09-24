<template>
  <div class="container">
    <ThreadSideBar
      :messages="threadComments"
      :root-message="rootMessage"
      :thread-id="threadId"
    />
    <EventSideBar :events="events" :channel-id="channelId" />
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
        :show="errorCountDown"
        dismissible
        variant="danger"
        @dismissed="errorCountDown = 0"
        @dismiss-count-down="errorCountDownChanged"
      >
        Error creating a new event
      </b-alert>
      <b-alert
        :show="successCountDown"
        dismissible
        variant="success"
        @dismissed="successCountDown = 0"
        @dismiss-count-down="successCountDownChanged"
      >
        Event created
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
                <b-icon-people />{{ followingUsers.length }} people
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
                  <Message v-if="rootMessage" :message="rootMessage" />
                  <p class="text-muted m-0 text-center">
                    {{ threadComments.length }}件の返信
                  </p>
                  <MessageList :messages="threadComments" />
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
  async fetch() {
    this.events = await this.$axios
      .get('/api/events.json?channel_id=' + this.$route.params.id)
      .then((res) => res.data.events)
    this.channelComments = await this.$axios
      .get('/api/comments/' + this.$route.params.id + '.json')
      .then((res) => {
        const comments = res.data
        if (!comments.message) {
          comments.message = ''
          comments.childThread = { channelId: 100, numOfComments: 30 }
        }
        return [comments]
      })
  },
  data: () => {
    return {
      addMyChannel: false,
      isThread: false,
      rootMessage: {
        commentId: 99,
        userId: 'hoge',
        timestamp: new Date().toDateString(),
        message: '何しようか\nhttps://www.google.com/',
        childThread: { channelId: 99, numOfComments: 30 },
      },
      followingUsers: [],
      hostUserId: 0,
      channelName: '',
      channelAbstract: '',
      channelComments: [],
      threadComments: [],
      threadId: null,
      events: [],
      newEventCreated: 0,
      errorCountDown: 0,
      successCountDown: 0,
    }
  },
  computed: {
    channelId() {
      return parseInt(this.$route.params.id, 10)
    },
  },
  created() {
    const tmp = this.$getChannelInfo(this.channelId)
    this.channelComments = tmp.channelComments
    this.followingUsers = tmp.followingUsers
    this.hostUserId = parseInt(tmp.hostUserId)
    this.channelName = tmp.channelName
    this.channelAbstract = tmp.channelAbstract
    // this.events = this.$getChannelEventInfo(this.channelId)
  },
  methods: {
    // getChannelInfo(channelId) {
    //   // チャンネルの情報を取得
    //   const tmpComments = []
    //   for (let i = 0; i < 10; i++) {
    //     tmpComments.push({
    //       commentId: i,
    //       timestamp: new Date().toDateString(),
    //       userId: 'hoge',
    //       message: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805',
    //       childThread: { channelId: 100 + i, numOfComments: 30 },
    //     })
    //   }
    //   const isRoot = true
    //   if (isRoot === true) {
    //     this.followingUsers = ['498', '34', '342']
    //     this.hostUserId = '320'
    //     this.channelName = 'machine learning'
    //     this.channelAbstract = 'channel for student studying ml'
    //     this.channelComments = tmpComments
    //   }
    // },
    getThreadInfo(threadId, rootMessage) {
      // スレッドの情報を取得
      const tmpThreads = []
      for (let i = 0; i < 10; i++) {
        tmpThreads.push({
          commentId: i + 100,
          userId: 'hoge',
          timestamp: new Date().toDateString(),
          message: '何しようか\nhttps://www.google.com/',
          childThread: {},
        })
      }
      const isRoot = false
      if (isRoot === false) {
        this.threadComments = tmpThreads
        this.threadId = 100
        this.rootMessage = rootMessage
      }
    },
    showThread() {
      if (this.threadComments) {
        this.isThread = true
      }
    },
    errorCountDownChanged(errorCountDown) {
      this.errorCountDown = errorCountDown
    },
    successCountDownChanged(successCountDown) {
      this.successCountDown = successCountDown
    },
    afterCreateEvent() {
      if (this.$refs.createEventModal.submit()) {
        this.successCountDown = 5
      } else {
        this.errorCountDown = 5
      }
    },
    // getChannelEventInfo(channelId) {
    //   for (let i = 0; i < 10; i++) {
    //     this.events.push({
    //       eventId: i,
    //       eventName: 'stydy for ml',
    //       eventAbstract:
    //         'event abstract\nevent abstract\nevent abstract\nevent abstract\n',
    //       hostDate: new Date().toDateString(),
    //       fromDate: new Date().toDateString(),
    //       toDate: new Date().toDateString(),
    //       zoomUrl: 'zoom.url',
    //     })
    //   }
    // },
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
