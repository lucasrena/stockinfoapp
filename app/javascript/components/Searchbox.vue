<template>
  <div class="search-wrapper">
    <input type="text" v-model="search" placeholder="Search by name..."/>
    <label>Search company:</label>
    <div>
      <p>Message is: {{ search }}</p>
    </div>
  </div>  
</template>

<script>
export default {
  name: 'Searchbox',
  data () {
    return {
      search: ''
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
    //   this.$http.plain.post('/signin', { email: this.email, password: this.password })
    //     .then(response => this.signinSuccessful(response))
    //     .catch(error => this.signinFailed(error))
    }
  }
}
</script>