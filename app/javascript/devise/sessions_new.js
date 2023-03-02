import Vue from 'vue/dist/vue.esm'

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
