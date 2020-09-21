export default (context) => {
  // const store = context.store
  context.app.router.beforeEach((to, from, next) => {
    next()
  })
}
