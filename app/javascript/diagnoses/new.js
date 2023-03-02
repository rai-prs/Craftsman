import Vue from 'vue/dist/vue.esm'

document.addEventListener("turbolinks:load", () => {
  new Vue({
    el: '#question',
    data: {
      
    },

    methods: {
      onChange: function() {
        scrollBy(0, 270);
        const input_checked = document.querySelectorAll("input:checked");
        const diagnosis_submit = document.getElementById("diagnosis-submit");
        const warning = document.getElementById("warning");
        
        if (input_checked.length == 14) {
          diagnosis_submit.disabled = false;
          diagnosis_submit.classList.add('btn-diagnosis-hover');
          warning.style.display = "none";
        }
      },

      onClick: function() {
        scrollTo(0, 0);
      },
    },

    computed: {
      
    }
  })
})                     
