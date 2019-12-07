<template>
  <div id="app">
    <searchbox/>
    <p>{{ message }}</p>
  </div>
</template>

<script>
import Searchbox from './components/Searchbox.vue'

export default {
  components: {
    Searchbox
  },
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
