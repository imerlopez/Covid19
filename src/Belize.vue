<template>
    <div>
       <Number :data ="number"/>
        <b-row> 
            <b-col>
                 <b-row><Chart :data="countryHistory" :type="'cases'"/></b-row>
            <b-row><Chart :data="countryHistory" :type="'deaths'"/></b-row>
            </b-col>
            <b-col class="country-info">
                <b-row><h2>{{selected}}</h2></b-row>
                <b-row><img :src="countryFlag" alt=""></b-row>
            </b-col>
        </b-row>
    </div>
</template>
<script>
import Number from './components/Number.vue'
import Chart from './components/GraphInfo.vue'
export default {
    name:'Belize',
    components:{
        Number,
        Chart,
    },
    data(){
        return {

            numbers: null,
            countries: [],
            globalData :{},
            countryData: null,
            countryHistory: null,
            selected: "Belize",
            selectedISO3:"",
            countryFlag:"",
            countryInfo:{},
            dataCountryData:[10, 39,40,39,0,0]

        }
    },
   created() {
      this.getCountryNames()
      this.getCountryData()
    
  },
    methods: {
      getCountryNames() {
          fetch('https://corona.lmao.ninja/v2/countries?sort=country')
          .then(response => response.json())
          .then(data => {
              this.globalData = data
              this.countryData = data[this.selected]
              data.forEach(country => {
                  this.countries.push(country.country)
              });
          })
      },

        getCountryData() {
          fetch(`https://corona.lmao.ninja/v2/countries/${this.selected}`)
          .then(response => response.json())
          .then(data => {
              this.countryData = data
              this.countryInfo = data.countryInfo
              this.countryFlag = data.countryInfo.flag
              this.selectedISO3 = data.countryInfo.iso3
              this.getCountryHistory()
              
          })
    
      },

        getCountryHistory() {
          fetch(`https://covidapi.info/api/v1/country/${this.selectedISO3}`)//
          .then(response => response.json())
          .then(data => {
              console.log(data)
              this.countryHistory = data
              this.number = data.result[Object.keys(data.result)[Object.keys(data.result).length-1]]
          })
      },

      getGraphData() {
        var tempArray = []
        for (let [key, value] of Object.entries(this.countryHistory.result)) {
            console.log(key)
            tempArray.push(value.confirmed)
        }
        console.log(tempArray)
        return tempArray
    }
    }
    
    
}
</script>
