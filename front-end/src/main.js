// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router/index.js'
import store from './store';
import Raphael from 'raphael/raphael'
import VeeValidate from 'vee-validate';
import 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import './../node_modules/bulma/css/bulma.css'
import '@fortawesome/fontawesome-free/css/all.css'
import '@fortawesome/fontawesome-free/js/all.js'
import {
  faHome,
  faUser,
  faUserPlus,
  faSignInAlt,
  faSignOutAlt
} from '@fortawesome/free-solid-svg-icons';
global.Raphael = Raphael

Vue.config.productionTip = false

Vue.use(VeeValidate);
/* eslint-disable no-new */
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');
