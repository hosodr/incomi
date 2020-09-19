import Vue from 'vue'

Vue.component('autolink', {
  // eslint-disable-next-line vue/require-prop-types
  props: ['text'],
  render(createElement) {
    const a = this.text.split(/(https?:\/\/[\w!?/+\-_~=;.,*&@#$%()'[\]]+)/i)
    const vnodes = a.map(function (x, i) {
      if (i % 2) {
        return createElement('a', { attrs: { href: x } }, x)
      } else {
        return this._v(x)
        // return createElement('span', {}, x)
      }
    }, this)
    return createElement('span', vnodes)
  },
})
