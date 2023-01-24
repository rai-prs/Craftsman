/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.




// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })


/* import Vue from 'vue/dist/vue.esm'
import SourceMapDevToolModuleOptionsPlugin from 'webpack/lib/SourceMapDevToolModuleOptionsPlugin'
import App from '../app.vue'


document.addEventListener("turbolinks:load", () => {
  new Vue({
    el: '#app',
    data: {
      userInfo: {
        userName: document.querySelector("[v-model='userInfo.userName']").value,
        email: document.querySelector("[v-model='userInfo.email']").value,
        password: document.querySelector("[v-model='userInfo.password']").value,
        passwordConfirmation: document.querySelector("[v-model='userInfo.passwordConfirmation']").value,
      },
      validation: {
        userName: true,
        email: true,
        password: true,
        passwordConfirmation: true,
      }
    },
    
    methods: {
      onBlur: function() {
        const inputs = document.getElementsByTagName('input');
        const completed = 'completed';
        for (let input of inputs) {
          if (input.type == "hidden") {
            continue;
          }
          else if (input.value !== '') {
            input.nextElementSibling.classList.add(completed);
          } 
          else if (input.nextElementSibling.classList.contains('completed') == true) {
            input.nextElementSibling.classList.remove(completed);
          }
        }
      },

      onBlurUserName: function() {
        if (this.userInfo.userName == "") {
          this.validation.userName = false;
        }
        else {
          this.validation.userName = true;
        }
      },
      
      onBlurEmail: function() {
        if (this.userInfo.email == "") {
          this.validation.email = false;
        }
        else {
          this.validation.email = true;
        }
      },

      onBlurPassword: function() {
        if (this.userInfo.password == "") {
          this.validation.password = false;
        }
        else {
          this.validation.password = true;
        }
      },

      onBlurPasswordConfirmation: function() {
        if (this.userInfo.passwordConfirmation == "") {
          this.validation.passwordConfirmation = false;
        }
        else {
          this.validation.passwordConfirmation = true;
        }
      },

      onclick: function() {
        const fieldIcons = document.getElementsByClassName("field-icon")
        for (let icon of fieldIcons) {
          if (icon.firstElementChild.className == "fa-sharp fa-solid fa-eye-slash"){
            icon.firstElementChild.className = "fa-eye fa-solid";
            icon.previousElementSibling.previousElementSibling.type = "text";
          }
          else {
            icon.firstElementChild.className = "fa-sharp fa-solid fa-eye-slash";
            icon.previousElementSibling.previousElementSibling.type = "password";
          }
        }
      }
    },

    computed: {
      validationSignUp: function () {
        const SignUp = document.getElementById('SignUp');
        if (this.validateUserName == true &&
            this.validateEmail == true &&
            this.validatePassword == true &&
            this.validatePasswordConfirmation == true &&
            this.userInfo.userName !== "" &&
            this.userInfo.email !== "" &&
            this.userInfo.password !== "" &&
            this.userInfo.passwordConfirmation !== "") {
          SignUp.classList.add('submitHover');
          return true;
        }
        else {
          SignUp.classList.remove('submitHover');
          return false;
        }
      },
      validateUserName: function () {
        let pattern = /^.{1,60}$/;
        if (this.userInfo.userName.length === 0) {
          return true;
        }
        else if (pattern.test(this.userInfo.userName) == false){
          return false;
        }
        else if (this.userInfo.userName.length >= 1) {
          this.validation.userName = true;
          return true;
        }
      },

      validateEmail: function () {
        let pattern = /^[A-Za-z0-9_+-]+(.[a-zA-Z0-9_+-]+)*@{1}([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[A-Za-z]{2,}$/;
        if (this.userInfo.email.length === 0) {
          return true;
        }
        else if (this.userInfo.email.length >= 1 && pattern.test(this.userInfo.email) == false){
          this.validation.email = true;
          return false;
        }
        else if (this.userInfo.email.length >= 1) {
          return true;
        }
      },

      validatePassword: function () {
        let pattern = /^(?=.*[A-Z])(?=.*[.?/-])[a-zA-Z0-9.?/-]{8,}$/
        if (this.userInfo.password.length === 0) {
          return true;
        }
        else if (this.userInfo.password.length >= 1 && pattern.test(this.userInfo.password) == false){
          this.validation.password = true;
          return false;
        }
        else if (this.userInfo.password.length >= 1) {
          return true;
        }
      },

      validatePasswordConfirmation: function () {
        if (this.userInfo.passwordConfirmation.length === 0) {
          return true;
        }
        else if (this.userInfo.passwordConfirmation.length >= 1 && this.userInfo.password !== this.userInfo.passwordConfirmation){
          this.validation.passwordConfirmation = true;
          return false;
        }
        else if (this.userInfo.passwordConfirmation.length >= 1) {
          return true;
        }
      },
    }
  })
})



document.addEventListener("turbolinks:load", () => {
  new Vue({
    el: '#login',
    data: {
      userInfo: {
        email: document.querySelector("[v-model='userInfo.email']").value,
        password: document.querySelector("[v-model='userInfo.password']").value,
      },
      validation: {
        email: true,
        password: true,
      }
    },
    
    methods: {
      onBlur: function() {
        const inputs = document.getElementsByTagName('input');
        const completed = 'completed';
        for (let input of inputs) {
          if (input.type == "hidden") {
            continue;
          }
          else if (input.value !== '') {
            input.nextElementSibling.classList.add(completed);
          } 
          else if (input.nextElementSibling.classList.contains('completed') == true) {
            input.nextElementSibling.classList.remove(completed);
          }
        }
      },

      
      
      onBlurEmail: function() {
        if (this.userInfo.email == "") {
          this.validation.email = false;
        }
        else {
          this.validation.email = true;
        }
      },

      onBlurPassword: function() {
        if (this.userInfo.password == "") {
          this.validation.password = false;
        }
        else {
          this.validation.password = true;
        }
      },

      

      onclick: function() {
        const fieldIcons = document.getElementsByClassName("field-icon")
        for (let icon of fieldIcons) {
          if (icon.firstElementChild.className == "fa-sharp fa-solid fa-eye-slash"){
            icon.firstElementChild.className = "fa-eye fa-solid";
            icon.previousElementSibling.previousElementSibling.type = "text";
          }
          else {
            icon.firstElementChild.className = "fa-sharp fa-solid fa-eye-slash";
            icon.previousElementSibling.previousElementSibling.type = "password";
          }
        }
      }
    },

    computed: {
      validationLogin: function () {
        const Login = document.getElementById('Login');
        if (this.validateEmail == true &&
            this.validatePassword == true &&
            this.userInfo.email !== "" &&
            this.userInfo.password !== "") {
          Login.classList.add('submitHover');
          return true;
        }
        else {
          Login.classList.remove('submitHover');
          return false;
        }
      },
      

      validateEmail: function () {
        let pattern = /^[A-Za-z0-9_+-]+(.[a-zA-Z0-9_+-]+)*@{1}([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[A-Za-z]{2,}$/;
        if (this.userInfo.email.length === 0) {
          return true;
        }
        else if (this.userInfo.email.length >= 1 && pattern.test(this.userInfo.email) == false){
          this.validation.email = true;
          return false;
        }
        else if (this.userInfo.email.length >= 1) {
          return true;
        }
      },

      validatePassword: function () {
        let pattern = /^(?=.*[A-Z])(?=.*[.?/-])[a-zA-Z0-9.?/-]{8,}$/
        if (this.userInfo.password.length === 0) {
          return true;
        }
        else if (this.userInfo.password.length >= 1 && pattern.test(this.userInfo.password) == false){
          this.validation.password = true;
          return false;
        }
        else if (this.userInfo.password.length >= 1) {
          return true;
        }
      },
    }
  })
})
 */
