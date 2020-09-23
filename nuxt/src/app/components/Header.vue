<template>
  <b-navbar toggleable="lg" type="dark" style="background-color: #4b64a1">
    <b-navbar-brand class="incomi" to="/" nuxt>incomi</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <b-nav-item to="/channel_list/" nuxt>Home</b-nav-item>
        <b-nav-item :to="{ name: 'mypage-id', params: { id: userId } }" nuxt
          >My page</b-nav-item
        >
      </b-navbar-nav>

      <!-- Right aligned nav items -->

      <b-navbar-nav class="ml-auto">
        <template v-if="isSignin">
          <!-- <b-dropdown-item to="/channel_list/" nuxt>signout</b-dropdown-item> -->
          <b-nav-item-dropdown right>
            <template v-slot:button-content>
              <em>{{ username }}</em>
            </template>
            <b-dropdown-item to="/channel_list/" nuxt>signout</b-dropdown-item>
          </b-nav-item-dropdown>
        </template>
        <template v-else>
          <nuxt-link class="btn btn-sm btn-light m-1" to="/signin" nuxt
            >signin</nuxt-link
          >
          <nuxt-link class="btn btn-sm btn-light m-1" to="/signup" nuxt
            >signup</nuxt-link
          >
        </template>

        <!-- <b-nav-item-dropdown right>
          Using 'button-content' slot
          <template v-slot:button-content>
            <em>{{ username }}</em>
          </template>
          <template v-if="isSignin">
            <b-dropdown-item to="/channel_list/" nuxt>signout</b-dropdown-item>
          </template>
          <template v-else>
            <b-dropdown-item to="/signin" nuxt>signin</b-dropdown-item>
            <b-dropdown-item to="/signup" nuxt>signup</b-dropdown-item>
          </template>
        </b-nav-item-dropdown> -->
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>

<script>
import { mapState, mapGetters } from 'vuex'
export default {
  computed: {
    ...mapState({
      userId: (state) => state.userId,
      username: (state) => state.username,
    }),
    ...mapGetters(['isSignin']),
  },
}
</script>
