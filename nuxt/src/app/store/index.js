import Vuex from 'vuex'

const store = () =>
  new Vuex.Store({
    state: {
      username: '',
    },
    getters: {},
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
