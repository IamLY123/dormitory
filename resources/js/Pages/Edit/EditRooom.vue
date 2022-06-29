<template>
    <app-layout title="EditRoom">
        <template #header>
            <h2>แก้ไขข้อมูลห้อง</h2>
        </template>
                <div class="py-6">
            <div class="max-w-xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-3">
                    <div v-for="(p) in rooms" v-bind:value="p.id">
                         <div  class="py-3">
                        <h1>เลขห้อง: {{p.room_number}}</h1>
                        <h1>ชั้น: {{p.floor.floor_name}}  </h1>
                        <h1>เตียง: {{p.bed.bed}}  </h1>
                        <h1>ขนาดห้อง : {{p.size.size}}  </h1>
                        <h1>ราคาห้องต่อเดือน: {{p.price}} บาท</h1>
                        <h1>ราคา Wifi ต่อเดือน: {{p.internet_price}} บาท</h1>
                        <h1>สิ่งที่มีอยู่ : {{p.detail}}</h1>
                        <h1>สถานะห้อง : {{p.status.status}}</h1>
                    </div>
                    <div class="" v-bind:value="p.id">
                    <form @submit.prevent="submit(p.id)">
                        <div class="" >
                        <jet-label for="size_id" value="ขนาดห้อง"/>
                        <select v-model="form.size_id" id="size_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                            <option disabled value="">Please select one</option>
                            <option v-for="(s) in sizes" v-bind:value="s.id">{{s.size}}</option>

                        </select>
                    </div>
                                 <div class="" >
                        <jet-label for="floor_id" value="ชั้น"/>
                        <select v-model="form.floor_id" id="floor_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                            <option disabled value="">Please select one</option>
                            <option v-for="(f) in floors" v-bind:value="f.id">{{f.floor_name}}</option>

                        </select>
                    </div>
                    <div class="" >
                        <jet-label for="bed_id" value="เตียง"/>
                        <select v-model="form.bed_id" id="bed_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                            <option disabled value="">Please select one</option>
                            <option v-for="(b) in beds" v-bind:value="b.id">{{b.bed}}</option>

                        </select>
                    </div>
                                <div class="" >
                        <jet-label for="status_id" value="สถานะห้อง"/>
                        <select v-model="form.status_id" id="bed_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                            <option disabled value="">Please select one</option>
                            <option v-for="(st) in statuses" v-bind:value="st.id">{{st.status}}</option>

                        </select>
                    </div>
                        <div class="">
                            <jet-label for="price" value="ค่าเช้าห้อง" />
                            <jet-input id="price" type="number" class="mt-1 block w-full" v-model="form.price"   required autofocus autocomplete="price"  />
                        </div>
                         <div class="">
                            <jet-label for="internet_price" value="ค่าเน็ต" />
                            <jet-input id="internet_price" type="number" class="mt-1 block w-full" v-model="form.internet_price"  required autofocus autocomplete="internet_price"  />
                        </div>
                                                     <div>
                            <jet-label for="detail" value="สิ่งที่มีอยู่ในห้อง" />
                            <textarea v-model="form.detail" id="detail" class="mt-1 block w-full border-gray-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" placeholder="add detail about room" required autofocus autocomplete="detail"></textarea>
                        </div>
                              <div class="flex items-center mt-4">
                            <jet-button class="ml-4" :class="{'opacity-25': form.processing}" :disabled="form.processing">
                                แก้ไข
                            </jet-button>
                        </div>     
                    </form>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </app-layout>
</template>
<script>
import { defineComponent } from 'vue'
import JetButton from '@/Jetstream/Button.vue'
import AppLayout from '../../Layouts/AppLayout.vue'
import JetInput from '@/Jetstream/Input.vue'
import { Inertia } from '@inertiajs/inertia'
import JetLabel from '@/Jetstream/Label.vue'

export default defineComponent({
  components: { AppLayout ,Inertia,JetButton,JetInput,JetLabel},
    setup() {
        
    },
    data(){
        return {
            form:this.$inertia.form({
                price:'',
                internet_price:'',
                size_id:'',
                floor_id:'',
                detail:'',
                bed_id:'',
                status_id:'',


            })
        }
    },props:['rooms','sizes','floors','beds','statuses'],
    methods:{
        submit(id){
            console.log(id);
            console.log(this.form)
            Inertia.post(route("room.edit",id),this.form,{
                forceFormData:true
            })
        }
    }
})
</script>
