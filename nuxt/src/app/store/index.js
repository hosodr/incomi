import Vuex from 'vuex'

const store = () =>
  new Vuex.Store({
    state: {
      username: 'hoge',
      userId: '1',
    },
    getters: {
      isSignin(state) {
        return state.username !== null && state.userId !== null
      },
    },
    mutations: {
      storeUsername(state, username) {
        state.username = username
      },
      signOut(state) {
        state.username = null
      },
    },
  })

export default store
