<template>
  <div class="p-5 bg-black">
    <div  class=" grid grid-cols-3 ">
      <div class=" col-span-2 text-white pl-44">Show Room For Guest</div>
      <div class="text-white text-right">Contact Us : +855 104 999 58</div>
    </div>
  </div>
    <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 ">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                  <h1 class=" text-center text-xl pt-5 font-bold">Room For Rent</h1>
                  <div class="max-w-5xl max-h-auto px-4 py-4 mx-auto rounded border-2 my-5" v-for="(r) in rooms" v-bind:value="r.id">
                    <div class="grid grid-cols-2 gap-4">
                      <div class="col-span-1 ... px-5">
                        <h1>Room Number: {{r.room_number}}</h1>
                        <h1>Floor : {{r.floor.floor_name}}</h1>
                        <h1>Size : {{r.size.size}}</h1>
                        <h1>Bed : {{r.bed.bed}}</h1>
                        <h1>Room Price For 1 month : {{r.price}} BAHT</h1>
                        <h1>Wifi Price For 1 month: {{r.internet_price}} BAHT</h1>
                        <h1>Other Items : {{r.detail}}</h1>
                      </div>
                      <div class="col-span-1 ...">
                        <img :src="'/storage/room_cover/'+r.photo" class="object-cover h-40 w-80 mx-36">
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
</template>
<script>
import { defineComponent } from 'vue'
import AppLayout from '../../Layouts/AppLayout.vue'


export default defineComponent({
  components: { AppLayout },
   props:['rooms',],
   components:[],
})
</script>

      AppLayout