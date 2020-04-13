<template>
    <div>
        <h1 class="introTop">Global Statistics | Covid 19 | Belize</h1>
        <Number :data ="number"/>
        <b-row> 
          <b-col><Chart :data="globalData" :type="'cases'"/></b-col>
          <b-col><Chart :data ="globalData" :type ="'deaths'"/></b-col>
        </b-row>

       
    </div>
</template> 
<script>

import Number from './components/Number.vue'
import Chart from './components/GraphInfo.vue'

export default {
  name: 'Home',
  components: {
    Number,
    Chart
  },
  data(){
    return {
      number: null,
      globalDate:{},
      dataGlobalChart:[10,39, 10,40,39,0,0]
    }
  },
  created(){
    this.getGlobalCount()
    this.getGlobalData()
  },

  methods:{

    getGlobalCount(){

      fetch('https://corona.lmao.ninja/all')
      .then(response => response.json())
      .then(data =>{
        this.number =data
      })

    },

    getGlobalData(){

      fetch('https://covidapi.info/api/v1/global/count')
      .then(response => response.json())
      .then(data => {

        this.globalData = data
        this.dataGlobalChart = this.getGraphicData()
      })
    },

    getGraphicData (){

      var tArray = []
      for(let[key, value] of Object.entries(this.globalData.result)){
        console.log(key)
        tArray.push(value.confirmed)
      }
      return  tArray
    }
  }
}
</script>
<style>
  .introTop{ 
    padding: 32px;
  }
</style>
