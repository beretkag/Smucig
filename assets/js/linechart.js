let query = localStorage.getItem('query');

let labels = GenerateAdat(query);


function GenerateAdat(query) {
    let labels = [];
    for (let i = 30; i => 0; i--) {
        let date = new Date();
        const previous = new Date(date.getTime());
        previous.setDate(date.getDate()-i);
        labels.push(previous);
    }
    console.log(labels);
    return labels;
}














let myChart = document.getElementById('myChart');

const DATA_COUNT = 12;
const labels = [];
for (let i = 0; i < DATA_COUNT; ++i) {
  labels.push(i.toString());
}
const datapoints = [0, 20, 60, 60, 120, 300, 120, 125, 105, 110, 170];
const data = {
  labels: labels,
  datasets: [
    {
      label: 'Egyenleg',
      data: datapoints,
      borderColor: '#ad192a',
      fill: true,
      cubicInterpolationMode: 'monotone',
      tension: 0.4
    }
  ]
};

const config = {
    type: 'line',
    data: data,
    options: {
      responsive: true,
      plugins: {
        title: {
          display: true,
          text: 'Chart.js Line Chart - Cubic interpolation mode'
        },
      },
      interaction: {
        intersect: false,
      },
      scales: {
        x: {
          display: true,
          title: {
            display: true
          }
        },
        y: {
          display: true,
          title: {
            display: true,
            text: 'Value'
          },
          suggestedMin: -10,
          suggestedMax: 200
        }
      }
    },
  };

  let massPopChart = new Chart(myChart, config);