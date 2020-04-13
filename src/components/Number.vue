<template>
    <div>
    <b-container class="by-example-row">
        <b-row v-if="data != null">
            <b-col><h1 v-if="data.cases" class ="confirm" >{{ data.cases.toLocaleString('en') }}</h1> <h1 v-else>{{data.confirmed.toLocaleString('en') }}</h1>Cases </b-col>
            <b-col><h1 class ="death">{{ data.deaths.toLocaleString('en') }}</h1>Deaths </b-col>
            <b-col><h1 class="recovered">{{ data.recovered.toLocaleString('en') }}</h1>Recovered </b-col>
        </b-row>
    </b-container>
    </div>
</template>
<script>
export default {
    
    name:'Number',
    props:["data"]
}
</script> 
<style>
  .confirm{ 
    color:blue;
  }
  .death{
      color:red;
  }
  .recovered{
      color:green;
  }
</style>
