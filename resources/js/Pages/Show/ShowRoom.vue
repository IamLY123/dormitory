<template>
   <app-layout title="ShowRoom">
       <template #header>
         <h2>ห้องที่มีอยู่</h2>
       </template>
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 ">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                  <h1 class=" text-center text-xl pt-5 font-bold">ห้องสำหรับเช้า</h1>
                  <div class="max-w-5xl max-h-auto px-4 py-4 mx-auto rounded border-2 my-5" v-for="(r) in rooms" v-bind:value="r.id">
                    <div class="grid grid-cols-2 gap-4">
                      <div class="col-span-1 ... px-5">
                        <h1>เลขห้อง: {{r.room_number}}</h1>
                        <h1>ชั้น : {{r.floor.floor_name}}</h1>
                        <h1>ขนาด : {{r.size.size}}</h1>
                        <h1>เตียง : {{r.bed.bed}}</h1>
                        <h1>ราคาห้องต่อเดือน: {{r.price}} บาท</h1>
                        <h1>ราคา Wifi ต่อเดือน: {{r.internet_price}} บาท</h1>
                        <h1>ของที่มีอยู่ในห้อง: {{r.detail}}</h1>
                      </div>
                      <div class="col-span-1 ...">
                        <img :src="'/storage/room_cover/'+r.photo" class="object-cover h-40 w-80 mx-36">
                      </div>
                    </div>

                  </div>
                </div>
            </div>
        </div>
   </app-layout> 
</template>
<script>
import { defineComponent } from 'vue'
import AppLayout from '../../Layouts/AppLayout.vue'

export default defineComponent({
  components: { AppLayout },
  props:['rooms',],
  methods:{
    // showImage(){
    //   return "/storage/app/public/room_cover/";
    // }
  }
  
})
</script>
