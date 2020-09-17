<template>
  <div class="container">
    <div class="card">
      <div class="card-header">
        <p class="float-left my-0">イベントの詳細</p>
        <nuxt-link class="float-right my-0 text-danger" to="id/edit"
          >削除</nuxt-link
        >
        <nuxt-link class="float-right my-0 mr-5" to="id/edit">編集</nuxt-link>
      </div>
      <div class="card-body">
        <h5 class="card-title">イベントタイトル</h5>
        <p class="card-text">
          詳細<br />詳細<br />詳細<br />詳細<br />詳細<br />詳細<br />詳細<br />詳細<br />詳細<br />
        </p>
      </div>
      <nuxt-link to="/channel_list/1">チャンネルに移動</nuxt-link>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {}
  },
}
</script>
