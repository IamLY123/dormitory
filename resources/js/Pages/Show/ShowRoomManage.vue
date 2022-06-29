<template>
   <app-layout title="ShowRoomManage">
       <template #header>
         <h2>ข้อมูลห้องทั้งหมด</h2>
       </template>
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 ">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                  <h1 class=" text-center text-xl pt-5 font-bold">ห้องทั้งหมด</h1>
                  <div class="max-w-5xl max-h-auto px-4 py-4 mx-auto rounded border-2 my-5" v-for="(r) in rooms" v-bind:value="r.id">
                    <div class="grid grid-cols-2 gap-4">
                      <div class="col-span-1 ... px-5">
                        <h1 v-if="r.status_id==2" class="text-red-500">กำลังเช้าอยู่</h1>
                        <h1 v-else class="text-green-500">ว่าง</h1>
                        <h1>เลขห้อง: {{r.room_number}}</h1>
                        <h1>ชั้น : {{r.floor.floor_name}}</h1>
                        <h1>ขยาดห้อง : {{r.size.size}}</h1>
                        <h1>เตียง : {{r.bed.bed}}</h1>
                        <h1>ราคาห้องต่อเดือน: {{r.price}} บาท</h1>
                        <h1>ราคา Wifi ต่อบาท: {{r.internet_price}} บาท</h1>
                        <h1>สิ่งที่มีอยู่ในห้อง: {{r.detail}}</h1>
                         <div class="grid grid-cols-2">
                           <!-- edit room -->
                        <div class="box-content h-5 w-10 my-2 py-2 px-2 mx-3  rounded bg-blue-500 text-white"><Link class="text-center" :href="route('update.room',r.id)">แก้ไข</Link></div>
                        <!-- delete room -->
                        <form @submit.prevent="submit(r.id)" v-if="r.status_id=='1'">
                                <jet-button class=" mx-2 my-2 bg-red-500 " :class="{'opacity-25': form.processing}" :disabled="form.processing">
                                ลบ
                            </jet-button>
                                </form>
                        </div >
                      </div>
                      <div class="col-span-1 ...">
                        <img :src="'/storage/room_cover/'+r.photo" class="object-cover h-60 w-100 mx-auto">
                      </div>
                    </div>

                  </div>
                </div>
            </div>
        </div>
   </app-layout> 
</template>
<script>
import { Inertia } from '@inertiajs/inertia'
import { defineComponent } from 'vue'
import AppLayout from '../../Layouts/AppLayout.vue'
import JetButton from '@/Jetstream/Button.vue'
import JetLabel from '@/Jetstream/Label.vue'
import { Link } from '@inertiajs/inertia-vue3'

export default defineComponent({
  components: { AppLayout ,Link,JetButton,JetLabel},
  props:['rooms'],
  methods:{
   submit(id){
     console.log(id)
     Inertia.delete(route('delete.room',id),{onBefore:()=>confirm('Are you sure?')})
   }
  },data(){
    return {
      form:this.$inertia.form({})
    }
  }
  
})
</script>
