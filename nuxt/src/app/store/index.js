import Vuex from 'vuex'

const store = () =>
  new Vuex.Store({
    state: {
      username: null,
      userId: null,
      email: 'gunjoiro_rabit@gunjo.com',
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
      storeUserId(state, userId) {
        state.userId = userId
      },
      signOut(state) {
        state.username = null
        state.userId = null
      },
    },
  })

export default store
