<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="py-5 col col-md-4">
        <img
          class="d-block mx-auto mb-0"
          src="@/assets/gunjoiro_rabit.png"
          width="70"
        />
        <h4 class="incomi text-center mb-3" style="color: #4b64a1">incomi</h4>
        <div v-if="failed" class="alert alert-danger">signin failed</div>
        <form>
          <div class="form-group">
            <label for="username">user name</label>
            <input
              id="username"
              v-model="username"
              type="text"
              class="mb-3 form-control"
              required
            />

            <label for="password">password</label>
            <input
              id="password"
              v-model="password"
              type="password"
              class="mb-3 form-control"
              required
            />
            <button
              type="button"
              class="btn btn-primary btn-block"
              :disabled="username === '' || password === ''"
              @click="onSubmit"
            >
              signin
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapMutations } from 'vuex'
export default {
  data() {
    return {
      username: '',
      password: '',
      failed: false,
    }
  },
  computed: {
    ...mapGetters(['isSignin']),
  },
  methods: {
    onSubmit() {
      this.storeUsername('username')
      this.storeUserId(1)
      this.$router.push('/channel_list')
    },
    ...mapMutations({
      storeUsername: 'storeUsername',
      storeUserId: 'storeUserId',
    }),
  },
}
</script>
