<template>
  <div class="container">
    <div class="row mt-3">
      <div class="col-md-8">
        <div class="row card-header mr-1 pb-0">
          <div class="col">
            <div class="row">
              <div class="col-md-6">
                <h4 class="row">
                  <b-icon-chat-right-text />
                  {{ thread.name }}
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

                <!-- <b-button v-b-modal.create-event size="sm" variant="secondary"
                  >create an event</b-button
                > -->
                <button
                  v-b-modal.create-event
                  type="button"
                  class="btn btn-sm btn-outline-secondary"
                >
                  create event
                </button>

                <button
                  v-b-toggle.sidebar-backdrop
                  type="button"
                  class="d-sm-none btn btn-sm btn-outline-secondary"
                >
                  show events
                </button>
              </div>
            </div>
            <SideBar />

            <!-- <b-popover
              target="is-favorite"
              :show.sync="addMyChannel"
              triggers="click"
              placement="top"
            >
              <strong>add your channel list!</strong>
            </b-popover> -->

            <div class="row">
              <p class="mb-0">{{ thread.abstract }}</p>
            </div>

            <div class="row">
              <p class="mr-1 mb-0 text-muted" style="font-size: 8">
                <b-icon-people />10 people
              </p>
              <p class="mr-1 mb-0 text-muted" style="font-size: 8">
                <b-icon-chat-dots />10 comments
              </p>
              <p class="mr-1 mb-0 text-muted" style="font-size: 8">
                <b-icon-calendar-2-event />10 events
              </p>
            </div>
          </div>

          <b-modal id="create-event" size="lg" title="Create a new event"
            ><CreateEventModal
          /></b-modal>
          <!-- </div> -->
        </div>

        <div class="row height-fixed scroll">
          <ul ref="messages" class="col list-group">
            <template v-for="(message, key) in messages">
              <Message
                :key="key"
                :message="message"
                :parent-th-id="thread.parentThId"
                :get-thread="getThread"
                :show-thread="showThread"
              />
            </template>
          </ul>
        </div>
        <div class="row">
          <div class="col list-group">
            <form class="form-group">
              <div class="input-group mb-3">
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
      </div>

      <div class="col-md-4 d-none d-sm-block">
        <b-card title="Card Title" no-body>
          <b-card-header header-tag="nav">
            <b-nav card-header tabs>
              <b-nav-item :active="isThread" @click="isThread = true"
                >Thread</b-nav-item
              >
              <b-nav-item :active="!isThread" @click="isThread = false"
                >Events</b-nav-item
              >
            </b-nav>
          </b-card-header>

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
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
import {
  BIconCursor,
  BIconSearch,
  BIconCalendar2Event,
  BIconChatRightText,
  BIconPeople,
  BIconChatDots,
} from 'bootstrap-vue'
export default {
  components: {
    BIconCursor,
    BIconSearch,
    BIconCalendar2Event,
    BIconChatRightText,
    BIconPeople,
    BIconChatDots,
  },
  data: () => {
    const date = new Date().toDateString()
    return {
      addMyChannel: false,
      isThread: false,
      thread: {
        thId: 1,
        name: 'チャンネルの名前',
        abstract: 'このチャンネルの詳細このチャンネルの詳細',
        parentCommentId: 2,
        parentThId: null,
      },

      messages: [
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 1,
          timestamp: date,
          userId: 1,
        },
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 2,
          timestamp: date,
          userId: 1,
        },
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 3,
          timestamp: date,
          userId: 1,
        },
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 4,
          timestamp: date,
          userId: 1,
        },
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 5,
          timestamp: date,
          userId: 1,
        },
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 1,
          timestamp: date,
          userId: 1,
        },
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 2,
          timestamp: date,
          userId: 1,
        },
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 3,
          timestamp: date,
          userId: 1,
        },
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 4,
          timestamp: date,
          userId: 1,
        },
        {
          msg: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805.pdf',
          cmId: 5,
          timestamp: date,
          userId: 1,
        },
      ],
      childThread: null,
      childMessages: null,
      events: [
        {
          evId: 2,
          thId: 3,
          hostId: 3,
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          expiredDate: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
          deleteFlag: false,
        },
        {
          evId: 2,
          thId: 3,
          hostId: 3,
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          expiredDate: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
          deleteFlag: false,
        },
        {
          evId: 2,
          thId: 3,
          hostId: 3,
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          expiredDate: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
          deleteFlag: false,
        },
        {
          evId: 2,
          thId: 3,
          hostId: 3,
          name: '機械学習勉強会',
          abstract: '初心者のための機械学習勉強会です',
          zoomUrl: 'zoom.url',
          datetime: new Date().toDateString(),
          expiredDate: new Date().toDateString(),
          from: new Date().toDateString(),
          to: new Date().toDateString(),
          deleteFlag: false,
        },
      ],
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.$refs.messages.scrollIntoView(false)
    })
  },
  computed: {},
  methods: {
    getThread(thId, cmId) {
      const thread = {
        thId: 1,
        name: 'スレッドの名前',
        abstract: 'このすれっどの詳細',
        parentCommentId: 2,
        parentThId: 2,
      }
      const date = new Date().toDateString()
      const message = [
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 1,
          timestamp: date,
          userId: 1,
        },
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 2,
          timestamp: date,
          userId: 1,
        },
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 3,
          timestamp: date,
          userId: 1,
        },
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 4,
          timestamp: date,
          userId: 1,
        },
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 5,
          timestamp: date,
          userId: 1,
        },
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 1,
          timestamp: date,
          userId: 1,
        },
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 2,
          timestamp: date,
          userId: 1,
        },
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 3,
          timestamp: date,
          userId: 1,
        },
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 4,
          timestamp: date,
          userId: 1,
        },
        {
          msg: '何しようか\nhttps://www.google.com/',
          cmId: 5,
          timestamp: date,
          userId: 1,
        },
      ]
      this.childThread = thread
      this.childMessages = message
    },
    showThread() {
      this.isThread = true
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
