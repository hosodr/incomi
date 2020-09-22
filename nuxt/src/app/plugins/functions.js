import Vue from 'vue'

Vue.prototype.$getChannelInfo = (channelId) => {
  // チャンネルの情報を取得
  const channelComments = []
  for (let i = 0; i < 10; i++) {
    channelComments.push({
      commentId: i,
      timestamp: new Date().toDateString(),
      userId: 'hoge',
      message: 'こんなんあるよhttps://arxiv.org/pdf/1810.04805',
      childThread: { channelId: 100 + i, numOfComments: 30 },
    })
  }
  const followingUsers = ['498', '34', '342']
  const hostUserId = '320'
  const channelName = 'machine learning'
  const channelAbstract = 'channel for student studying ml'
  return {
    channelComments,
    followingUsers,
    hostUserId,
    channelName,
    channelAbstract,
  }
}

Vue.prototype.$getChannelEventInfo = (channelId) => {
  const events = []
  for (let i = 0; i < 10; i++) {
    events.push({
      eventId: i,
      eventName: 'stydy for ml',
      eventAbstract:
        'event abstract\nevent abstract\nevent abstract\nevent abstract\n',
      hostDate: new Date().toDateString(),
      fromDate: new Date().toDateString(),
      toDate: new Date().toDateString(),
      zoomUrl: 'zoom.url',
    })
  }
  return events
}

Vue.prototype.$getChannels = () => {
  const channels = []
  for (let i = 0; i < 10; i++) {
    channels.push({
      channel: {
        channelId: i,
        channelName: 'hoge',
        channelAbstract: 'stydy about hoge',
      },
      numOfComments: 20,
      numOfEvents: 18,
    })
  }
  return channels
}
