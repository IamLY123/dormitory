<template>
<!-- room data -->
  <div class="grid grid-cols-3 gap-4 bg-white" >
  <div class="py-5 ">
    <h1 class="text-lg text-center">กราฟแสดงจำนวนห้องที่มีผู้เข้าพักอาศัยแต่ละเดือน</h1>
    <div class="text-center" v-for="(u) in userdata" v-bind:value="u.id">
      <h1>เดือน {{u.month}} มีจำนวนห้องที่มีคนเข้าพัก {{u.data}}  ห้อง</h1>
    </div>
  </div>
  <div class="col-span-2">
    <canvas id="user-chart"></canvas>
  </div>
  </div>
  <!-- payment data -->
  <div class="grid grid-cols-3 gap-4 bg-white" >
  <div class="py-5 ">
    <h1 class="text-lg text-center">กราฟแสดงรายได้ค่าเช้ากับค่าอินเตอร์เน็ตแต่ละเดือน</h1>
    <div class="text-center" v-for="(p) in paymentdata" v-bind:value="p.id">
      <h1>เดือน {{p.month}} มีรายได้ {{p.data}}  บาท</h1>
    </div>
  </div>
  <div class="col-span-2">
    <canvas id="payment-chart"></canvas>
  </div>
  </div>
  <!-- electric data -->
    <div class="grid grid-cols-3 gap-4 bg-white">
    <div class="py-5 ">
    <h1 class="text-lg text-center">กราฟแสดงค่าไฟ้แต่ละเดือน</h1>
    <div class="text-center" v-for="(b) in bardata" v-bind:value="b.id">
      <h1>เดือน {{b.month}} ค่าไฟทั้งหมด {{b.data}}  บาท</h1>
    </div>
  </div>
  <div class="col-span-2 ">
        <canvas id="planet-chart"></canvas>
  </div>
  </div>
  <!-- water data -->
    <div class="grid grid-cols-3 gap-4 bg-white">
  <div class="py-5 ">
    <h1 class="text-lg text-center">กราฟแสดงค่านำ้แต่ละเดือน</h1>
    <div class="text-center" v-for="(w) in waterdata" v-bind:value="w.id">
      <h1>เดือน {{w.month}} ค่านำ้ทั้งหมดจำนวน {{w.data}}  บาท</h1>
    </div>
  </div>
  <div class="col-span-2">
    <canvas id="water-chart"></canvas>
  </div>
  </div>
</template>

<script>
import {Chart} from 'chart.js'
import moment from 'moment';
// electric
function myChart(data1){
  const data=[];
  console.log(data1)
  for( var i=0;i<data1.length;i++){
    data.unshift(data1[i]['month']);
  }
  return data;
}
function Label(data1){
  const label=[];
  for( var i=0;i<data1.length;i++){
    label.unshift(data1[i]['data']);
  }
  return label;
}
// userData
function userLabel(data1){
  const label=[];
  console.log(data1)
  for( var i=0;i<data1.length;i++){
    label.unshift(data1[i]['month']);
  }
  return label;
 
}
function userData(data1){
   const data=[];
  for( var i=0;i<data1.length;i++){
    data.unshift(data1[i]['data']);
  }
  return data;
}
// water
function waterLabel(data1){
  const label=[];
  console.log(data1)
  for( var i=0;i<data1.length;i++){
    label.unshift(data1[i]['month']);
  }
  return label;
 
}
function waterData(data1){
   const data=[];
  for( var i=0;i<data1.length;i++){
    data.unshift(data1[i]['data']);
  }
  return data;
}
// payment
function paymentLabel(data1){
  const label=[];
  console.log(data1)
  for( var i=0;i<data1.length;i++){
    label.unshift(data1[i]['month']);
  }
  return label;
 
}
function paymentData(data1){
   const data=[];
  for( var i=0;i<data1.length;i++){
    data.unshift(data1[i]['data']);
  }
  return data;
}



export default {
  name: 'Bar',
  component:{Chart},
  props:['bardata','userdata','waterdata','paymentdata'],
  methods:{},
  data() {
    return { 
      // electric
      planetChartData: {
    type: 'bar',
    data: {
        labels:myChart(this.bardata),
        datasets: [{
            label: '# ค่าไฟ้หอ',
            data:Label(this.bardata),
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
            ],
            borderWidth: 1
        }]
    },
    options: {
           scales:{
        yAxes:[{
          ticks:{
            beginAtZero:true,
            min:0.00,
            // max:3000.00,
            stepSize:300.00
          }
        }]}
    }
},
// room data
usergraph: {
    type: 'bar',
    data: {
        labels:userLabel(this.userdata),
        datasets: [{
            label: '# จำนวนห้องที่มีคนเช้า',
            data:userData(this.userdata),
            backgroundColor: [
                'rgba(183, 244, 216,0.2)'
            ],
            borderColor: [
                'rgba(22, 160, 133, 1)',
                
            ],
            borderWidth: 1
        }]
    },
    options: {
           scales:{
        yAxes:[{
          ticks:{
            beginAtZero:true,
            min:0,
            // max:10,
            stepSize:1
          }
        }]}
    }
},
// water data
watergraph: {
    type: 'bar',
    data: {
        labels:waterLabel(this.waterdata),
        datasets: [{
            label: '# จำนวนผู้เข้าพักหอ',
            data:waterData(this.waterdata),
            backgroundColor: [
                'rgba(249, 105, 14,0.2)'
            ],
            borderColor: [
                'rgba(241, 90, 34, 1)',
                
            ],
            borderWidth: 1
        }]
    },
    options: {
        // scales: {
        //     y: {
        //         beginAtZero: true,
        //         min:0
                
        //     }
        // }
        scales:{
        yAxes:[{
          ticks:{
            beginAtZero:true,
            min:0,
            // max:300,
            stepSize:40
          }
        }]}
    }
}
,
// payment data
paymentgraph:{
    type: 'bar',
    data: {
        labels:paymentLabel(this.paymentdata),
        datasets: [{
            label: '# รายได้',
            data:paymentData(this.paymentdata),
            backgroundColor: [
                'rgba(60, 179, 113,0.2)'
            ],
            borderColor: [
                'rgba(60, 179, 113, 1)',
                
            ],
            borderWidth: 1
        }]
    },
    options: {
        // scales: {
        //     y: {
        //         beginAtZero: true,
        //         min:0
                
        //     }
        // }
        scales:{
        yAxes:[{
          ticks:{
            beginAtZero:true,
            min:3000,
            // max:300,
            stepSize:3000
          }
        }]}
    }
}

,
    
    }
  },  mounted() {
    const ctx = document.getElementById('planet-chart');
    const ctx1=document.getElementById('user-chart');
    const ctx2=document.getElementById('water-chart');
     const ctx3=document.getElementById('payment-chart');
    new Chart(ctx, this.planetChartData);
    new Chart(ctx1,this.usergraph);
    new Chart(ctx2,this.watergraph);
    new Chart(ctx3,this.paymentgraph);
  },

}
</script>
