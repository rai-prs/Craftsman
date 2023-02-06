import Vue from 'vue/dist/vue.esm'

document.addEventListener("turbolinks:load", () => {
  new Vue({
    el: '#question',
    data: {
      
    },

    methods: {
      onChange: function() {
        scrollBy(0, 270);
        const communication = document.getElementsByName("diagnosis[communication]");
        const planning = document.getElementsByName("diagnosis[planning]");
        const dexterous = document.getElementsByName("diagnosis[dexterous]");
        const high = document.getElementsByName("diagnosis[high]");
        const tidy = document.getElementsByName("diagnosis[tidy]");
        const physically = document.getElementsByName("diagnosis[physically]");
        const muscle = document.getElementsByName("diagnosis[muscle]");
        const intelligence = document.getElementsByName("diagnosis[intelligence]");
        const careful = document.getElementsByName("diagnosis[careful]");
        const pride = document.getElementsByName("diagnosis[pride]");
        const picky = document.getElementsByName("diagnosis[picky]");
        const destruction = document.getElementsByName("diagnosis[destruction]");
        const narrow = document.getElementsByName("diagnosis[narrow]");
        const dirt = document.getElementsByName("diagnosis[dirt]");
        const diagnosis_submit = document.getElementById("diagnosis-submit");
        
        for (let i=0; i<communication.length; i++){
          if (communication[i].checked &&
              planning[i].checked &&
              dexterous[i].checked &&
              high[i].checked &&
              tidy[i].checked &&
              physically[i].checked &&
              muscle[i].checked &&
              intelligence[i].checked &&
              careful[i].checked &&
              pride[i].checked &&
              picky[i].checked &&
              destruction[i].checked &&
              narrow[i].checked &&
              dirt[i].checked) {
            diagnosis_submit.disabled = false;
            diagnosis_submit.classList.add('btn-diagnosis-hover');
          }
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
