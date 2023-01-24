document.addEventListener('turbolinks:load', () => {
  const radarLabel = ["職人度", "体力", "器用度", "親方度", "環境適正", "知力"];
  const communication = gon.communication;
  const planning = gon.planning;
  const dexterous = gon.dexterous;
  const tidy = gon.tidy;
  const physically = gon.physically;
  const muscle = gon.muscle;
  const intelligence = gon.intelligence;
  const careful = gon.careful;
  const pride = gon.pride;
  const picky = gon.picky;
  const narrow = gon.narrow;
  const dirt = gon.dirt;
  const high = gon.high;
  const craftsman = parseInt(communication) + parseInt(planning);
  const stamina = parseInt(physically) + parseInt(muscle);
  const intellect = parseInt(intelligence) - parseInt(careful) + 6;
  const dexterity = parseInt(dexterous) + parseInt(tidy);
  const master = parseInt(pride) + parseInt(picky);
  const breaking = (15 - parseInt(narrow) - parseInt(dirt) - parseInt(high)) * 0.82;
　　　　
  const radarChartData = {
    labels: radarLabel,
    datasets: [
      {
        label: '職人適正診断',
        data: [craftsman, stamina, dexterity, master, breaking, intellect],
        backgroundColor: 'rgba(255,162,0,0.3)',
        borderColor: 'rgba(255,146,2,1)',
        borderWidth: 1,
        spanGaps: true,
      },
    ],
  };

  const radarChartOption = {
    scales: {
      r: {
        min: 0,
        max: 10,
        ticks: {
          stepSize: 1,
          callback: function (value, index, values) {
            if (value == 0) {
              return '０';
            } else if (value == 2) {
              return '2';
            } else if (value == 4) {
              return '4';
            } else if (value == 6) {
              return '6';
            } else if (value == 8) {
              return '8';
            } else if (value == 10) {
              return '10';
            }
          },
        },
      },
    },
  };

  const radarChartContext = document.getElementById('radar-chart').getContext('2d');
  new Chart(radarChartContext, {
    type: 'radar',
    data: radarChartData,
    options: radarChartOption,
  });
  console.log(craftsman);
});
