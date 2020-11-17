<template>
  <div class="teams">
    <span class="tag text is-warning"><strong>Team Joker</strong></span>
    <ol class="text2" type="I">
      <li>Zhiang Peng |<a class="link" href="http://localhost:8080/#/user"> See profile</a></li>
      <li>Grégory Koenig |<a class="link" href="http://localhost:8080/#/user"> See profile</a></li>
      <li>Amel Neffati |<a class="link" href="http://localhost:8080/#/user"> See profile</a></li>
    </ol>
  </div>
</template>
<script>
export default {
  name: 'WorkingTime',
  props: {
    msg: String
  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
a {
      color: #7a7a7a;
}

.text {
  font-size: 10px;
  text-transform: uppercase;
}

.text2 {
  font-size: 11px;
  text-transform: uppercase;
}

.tag:not(body).is-warning {
    background-color: #ffe436;
    color: rgba(0, 0, 0, 0.7);
}

.teams {
  text-align: left;
}
</style>
