<template>
  <div class="search-wrapper">
    <div>
      <p>Search company:</p>
    </div>
    <input type="text" v-model="search" placeholder="Search by name..."/>
    <button v-on:click="searchCompanies">Search</button>    
    <div>
      <grid :gridData="gridData" :columns="gridColumns"></grid>
    </div>
  </div>  
</template>

<script>
import Grid from './Grid.vue'

export default {
  components: {
    Grid
  },
  name: 'Searchbox',
  data () {
    return {
      search: '',
      result: [],
      gridColumns: ["name","symbol"]
    }
  },
  computed: {
    gridData: function(){
      if(this.result != null){
        return this.result;
      }
      else{
        return [];
      }
    }
  },
  mounted(){    
      console.log(this.$http);
  },
  methods: {
    searchCompanies () {
      this.$http.get('/api/companies/', { params :{ name : this.search }})
        .then(response => this.result = response.body)
        .catch(error => this.result = error.body)
    }
  }
}
</script>