<template>
  <div class="card-content">
    <h1 class="introTop">Global Statistics | Covid 19 | Belize</h1>
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
          <b-card-text> {{ number.cases }}</b-card-text>
        </b-card>

        <b-card
          bg-variant="success"
          text-variant="white"
          header="Recovered"
          class="text-center"
        >
          <i class="fa-solid fa-hand-holding-medical"></i>
          <b-card-text>{{ number.recovered }}</b-card-text>
        </b-card>

        <b-card
          bg-variant="danger"
          text-variant="white"
          header="Deaths"
          class="text-center"
        >
          <i class="fa-solid fa-skull-crossbones"></i>
          <b-card-text>{{ number.deaths }}</b-card-text>
        </b-card>
      </b-card-group>
      <div class="graph">
        <bar-chart></bar-chart>
      </div>
    </div>
  </div>
</template>
<script>
// import Number from "./components/Number.vue";
import BarChart from "./components/BarChart.vue";

export default {
  name: "Home",
  components: {
    BarChart,
  },
  data() {
    return {
      number: null,
    };
  },
  created() {
    this.getGlobalCount();
    // this.getGlobalData();
  },

  methods: {
    getGlobalCount() {
      fetch("https://disease.sh/v3/covid-19/all")
        .then((response) => response.json())
        .then((data) => {
          this.number = data;
        });
    },
  },
};
</script>
<style>
.introTop {
  padding: 32px;
  margin-top: auto;
}
.card-content {
  margin: 20px;
}
.graph {
  padding: 30px;
}
</style>
