<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="py-5 col col-md-4">
        <img
          class="d-block mx-auto mb-4"
          src="https://getbootstrap.com/docs/4.5/assets/brand/bootstrap-solid.svg"
          width="70"
        />
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
    ...mapGetters(['issignin']),
  },
  methods: {
    onSubmit() {
      // const form = new FormData()
      // form.set('username', this.username)
      // form.set('password', this.password)
      // this.$axios
      //   .post('/api/auth/signin/', form)
      //   .then((res) => {
      //     const token = res.data.token
      //     this.storeToken(token)
      //     this.storeUsername(this.username)
      //     this.$router.push('/bbs_list')
      //   })
      //   .catch(() => {
      //     this.failed = true
      //   })
      this.$router.push('/')
    },
    ...mapMutations({
      storeToken: 'storeToken',
      storeUsername: 'storeUsername',
    }),
  },
}
</script>
