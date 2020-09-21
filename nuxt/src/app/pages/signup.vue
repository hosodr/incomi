<template>
  <div id="container" class="container">
    <div class="row justify-content-center">
      <div class="py-5 col col-md-4">
        <img
          class="d-block mx-auto mb-4"
          src="https://getbootstrap.com/docs/4.5/assets/brand/bootstrap-solid.svg"
          width="70"
        />
        <h2 class="text-center">create an acount</h2>
        <div v-if="failed" class="alert alert-danger" role="alert">
          {{ errorMessage }}
        </div>
        <form>
          <div class="form-group">
            <label>please fill in your username</label>
            <input
              v-model="username"
              class="form-control"
              type="text"
              required
            />
          </div>
          <div class="form-group">
            <label>please fill in your user id</label>
            <input v-model="userId" class="form-control" type="text" required />
          </div>
          <div class="form-group">
            <label>please fill in your email address</label>
            <input v-model="email" class="form-control" type="email" required />
          </div>
          <div class="form-group">
            <label>please fill in password</label>
            <input
              v-model="password1"
              class="form-control"
              type="password"
              required
            />
          </div>
          <div class="form-group">
            <label>password one more </label>
            <input
              v-model="password2"
              class="form-control"
              type="password"
              required
            />
          </div>
          <p
            v-if="isSamePassword && !emptyPassword"
            class="text-success"
            role="alert"
          >
            <span
              class="glyphicon glyphicon-exclamation-sign"
              aria-hidden="true"
            ></span>
            Password matched
          </p>
          <p v-else-if="!isSamePassword" class="text-danger" role="alert">
            <span
              class="glyphicon glyphicon-exclamation-sign"
              aria-hidden="true"
            ></span>
            Password mismatched
          </p>

          <div class="form-group">
            <button
              type="button"
              class="btn btn-primary btn-block"
              tabindex="-1"
              role="button"
              aria-disabled="true"
              :disabled="!isSamePassword || emptyPassword || emptyUsername"
              @click="onSubmit"
            >
              registar
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { mapMutations } from 'vuex'
export default {
  data() {
    return {
      username: '',
      userId: '',
      email: '',
      password1: '',
      password2: '',
      errorMessage: '',
      failed: false,
    }
  },
  computed: {
    emptyUsername() {
      return this.username === ''
    },
    emptyPassword() {
      return this.password1 === '' || this.password2 === ''
    },
    isSamePassword() {
      return this.password1 === this.password2
    },
  },
  methods: {
    onSubmit() {
      // const form = new FormData()
      // form.set('username', this.username)
      // form.set('password', this.password1)
      // this.$axios
      //   .post('/api/auth/register/', form)
      //   .then((res) => {
      //     this.$axios
      //       .post('/api/auth/signin/', form)
      //       .then((res) => {
      //         const token = res.data.token
      //         this.storeToken(token)
      //         this.$store.this.$router.push('/bbs_list')
      //       })
      //       .catch(() => {
      //         alert('ログインエラー')
      //       })
      //   })
      //   .catch(() => {
      //     this.errorMessage = '既に使われているユーザーネームです'
      //     this.failed = true
      //   })
      this.$router.push('/')
    },
    ...mapMutations({
      storeToken: 'storeToken',
    }),
  },
}
</script>
