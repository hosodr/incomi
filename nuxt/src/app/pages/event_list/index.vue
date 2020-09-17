<template>
  <div class="container">
    <div class="row justify-content-center">
      <h1>イベント一覧</h1>
    </div>
    <button class="btn btn-primary">チャンネルに戻る</button>
    <form class="form-inline my-2 my-lg-0">
      <input
        class="form-control mr-sm-2"
        type="search"
        placeholder="Search"
        aria-label="Search"
      />
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
        Search
      </button>
    </form>
    <div class="row justify-content-center">
      <template v-for="event in events">
        <EventItem :key="event.id" :event="event" />
      </template>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
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
}
</script>
