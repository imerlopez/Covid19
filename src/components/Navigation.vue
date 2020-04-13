<template>
    <div>
       <b-navbar class ="navTop" toggleable="lg" type="dark" text-variant="white" variant="danger">
    <b-navbar-brand href="#">Covid-19 Tracker</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <b-nav-item to="/">Global</b-nav-item>
        <b-nav-item to="/belize">Belize</b-nav-item>
      </b-navbar-nav>

      <b-navbar-nav class="ml-auto">
        <b-nav-item href="https://github.com/codelopez501" target="_blank" >Imer Lopez | GitHub</b-nav-item>
        <b-nav-item href="https://github.com/novelcovid/api" target="_blank">API Documentation</b-nav-item>
        <b-nav-item href="https://www.worldometers.info/coronavirus/" target="_blank">Information Source</b-nav-item>
         <b-nav-item href="https://covid19.bz/" target="_blank">Covid Official Site - Belize</b-nav-item>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>

    </div>
</template>
<script>
export default {
    name:'Navigation',
}
</script>

<style>
  .navTop{ 
    overflow: hidden;
    background-color: #333;
    position: fixed; /* Set the navbar to fixed position */
    top: 0; /* Position the navbar at the top of the page */
    width: 100%; /* Full width */
  }
</style>

