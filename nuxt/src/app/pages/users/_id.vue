<template>
  <h1>Hello, {{ name }}</h1>
</template>

<script>
export default {
  asyncData({ $axios, params }) {
    return $axios
      .$get(`/api/hellos/${params.id}.json`)
      .then((res) => {
        return { name: res.text }
      })
      .catch((e) => {
        return { name: e }
      })
  },
}
</script>
