<template>
  <div class="content">
    <h2 class="title-country">{{ selected }}</h2>
    <b-img
      :src="countryFlag"
      thumbnail
      fluid
      width="75"
      height="75"
      alt="Belize"
    />

    <div class="mt-3">
      <b-card-group deck>
        <b-card
          bg-variant="info"
          text-variant="white"
          font="bold"
          header=" Cases"
          class="text-center"
        >
          <i class="fa-solid fa-chart-line"></i>
          <b-card-text> {{ countryHistory.cases }}</b-card-text>
        </b-card>

        <b-card
          bg-variant="success"
          text-variant="white"
          header="Recovered"
          class="text-center"
        >
          <i class="fa-solid fa-hand-holding-medical"></i
          ><b-card-text>{{ countryHistory.recovered }}</b-card-text>
        </b-card>

        <b-card
          bg-variant="danger"
          text-variant="white"
          header="Deaths"
          class="text-center"
        >
          <i class="fa-solid fa-skull-crossbones"></i>
          <b-card-text>{{ countryHistory.deaths }}</b-card-text>
        </b-card>
      </b-card-group>
      <div class="graph">
        <bar-chart></bar-chart>
      </div>
    </div>
  </div>
</template>
<script>
import BarChart from "./components/BelizeChart.vue";

export default {
  name: "Belize",

  components: { BarChart },
  data() {
    return {
      numbers: null,
      countries: [],
      cases: "",
      globalData: {},
      countryData: null,
      countryHistory: null,
      selected: "Belize",
      selectedISO3: "",
      countryFlag: "",
      countryInfo: {},
      dataCountryData: [10, 39, 40, 39, 0, 0],
    };
  },
  created() {
    this.getCountryNames();
    this.getCountryData();
  },
  methods: {
    getCountryNames() {
      fetch("https://disease.sh/v3/covid-19/countries")
        .then((response) => response.json())
        .then((data) => {
          this.globalData = data;
          this.countryData = data[this.selected];
          data.forEach((country) => {
            this.countries.push(country.country);
          });
        });
    },

    getCountryData() {
      fetch(`https://disease.sh/v3/covid-19/countries/${this.selected}`)
        .then((response) => response.json())
        .then((data) => {
          this.countryData = data;
          this.countryInfo = data.countryInfo;
          this.countryFlag = data.countryInfo.flag;
          this.selectedISO3 = data.countryInfo.iso3;
          this.getCountryHistory();
        });
    },

    getCountryHistory() {
      fetch(`https://disease.sh/v3/covid-19/countries/${this.selected}`) //
        .then((response) => response.json())
        .then((data) => {
          this.countryHistory = data;
          console.log(data);
        });
    },

    getGraphData() {
      var tempArray = [];
      for (let [key, value] of Object.entries(this.countryHistory)) {
        console.log(key);
        tempArray.push(value.cases);
      }
      console.log(tempArray);
      return tempArray;
    },
  },
};
</script>
<style>
.content {
  margin: 20px;
  padding: 20px;
}
.title-country {
  text-align: center;
}
.graph {
  padding: 30px;
}
</style>
