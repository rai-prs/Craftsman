// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import Vue from 'vue'
import App from '../app.vue'
import Router from'./router.js'

require('../devise/registrations_new')
require('../devise/sessions_new')
require('../diagnoses/new')
require('../diagnoses/show')

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App),
    router: Router
  }).$mount()
  document.body.appendChild(app.$el)
})
