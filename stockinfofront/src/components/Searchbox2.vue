<template>
  <div class="search-wrapper">
    <input type="text" v-model="search" placeholder="Search by name..."/>
    <label>Search company:</label>
    <button v-on:click="searchCompanies">Search</button>
    <div>
      <p>Message is: {{ search }}</p>
      <p>Response is: {{ result }}</p>
    </div>
  </div>  
</template>

<script>
export default {
  name: 'Searchbox2',
  data () {
    return {
      search: '',
      result: ''
    }
  },
  created () {
    //this.checkSignedIn()
  },
  updated () {
    //this.checkSignedIn()
  },
  methods: {
    searchCompanies () {
      debugger;
      this.$http.get('/companies')
        .then(response => this.result = response.body)
        .catch(error => this.result = error)
    }
  }
}
</script>