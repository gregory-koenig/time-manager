<template>
<html>
<body>
  <div id="app">
  <section class="main-content columns is-fullheight">
    <aside class="column is-2 is-narrow-mobile is-fullheight section is-hidden-mobile">
      <ul class="menu-list">
        <li>
          <a href="#" v-on:click="toggleUser" class="">
            <span class="icon"><i class="far fa-user"></i></span> My profile
          </a>
        </li>
        <li>
          <a href="#" v-on:click="toggleChartManager" class="is-active">
            <span class="icon"><i class="fas fa-chart-line"></i></span> My working time
          </a>
          <ul>
            <li>
              <a href="#" v-on:click="toggleWorkingTime">
                <span class="icon is-small"><i class="fas fa-calendar-alt"></i></span> My Teams
              </a>
            </li>
            <li>
              <a href="#" v-on:click="toggleWorkingTimes">
                <span class="icon is-small"><i class="fas fa-business-time"></i></span> Employee's working time
              </a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#" v-on:click="toggleClockManager" class="">
            <span class="icon"><i class="far fa-clock"></i></span> ClockManager
          </a>
        </li>
      </ul>
    </aside>
    <div class="container column is-10">
      <div class="section">
        <div class="card">
          <div class="card-content">
            <div class="content">
              <keep-alive>
                <component v-bind:is="component" />
              </keep-alive>
            </div>
          </div>
        </div>
        <br />
      </div>
    </div>
  </section>
  </div>
</body>
</html>
</template>

<script>
import User from './User'
import WorkingTime from './WorkingTime.vue'
import WorkingTimes from './WorkingTimes.vue'
import ClockManager from './ClockManager.vue'
import ChartManager from './ChartManager.vue'

export default {
  name: 'home',
  components: {
    User,
    WorkingTime,
    WorkingTimes,
    ClockManager,
    ChartManager
  },
  data () {
    return {
      component: 'ChartManager'
    }
  },
  methods: {
    toggleUser () {
      this.component = User
    },
    toggleWorkingTime () {
      this.component = WorkingTime
    },
    toggleWorkingTimes () {
      this.component = WorkingTimes
    },
    toggleClockManager () {
      this.component = ClockManager
    },
    toggleChartManager () {
      this.component = ChartManager
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.menu-list a.is-active {
    background-color: #ffe436;
    color: #fff;
}

.menu-label {
  font-size: 11px;
}
.menu-list a {
    text-align: left;
    font-size: 10px;
    letter-spacing: 1px;
    text-transform: uppercase;
    border-radius: 2px;
    color: #4a4a4a;
    display: block;
    padding: 0.5em 0.75em;
}

.menu-list li ul {
    border-left: 1px solid #dbdbdb;
    margin: 0.60em;
    padding-left: 0.60em;
}

html, body, #app {
  height: 100%;
}
#app {
  min-height: 100%;
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 10px;
  display: flex;
  flex-direction: column;
}
.main-content {
  flex: 1;
}
.footer {
  margin-top: -12px;
}
@media screen and (max-width: 768px) {
  #menu-toggle:checked + .nav-menu {
    display: block;
  }
}
</style>
