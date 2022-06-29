<template>
    <app-layout title="EditElectric">
        <template #header>
            <h2>แก้ไขข้อมูลค่าไฟ</h2>
        </template>
                <div class="py-6">
            <div class="max-w-xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-3">
                    <div v-for="(p) in electric" v-bind:value="p.id">
                    <form @submit.prevent="submit(p.id)">
                    <div v-bind:value="p.id" class="py-3">
                        <h1>เลขห้อง: {{p.roomrent.room.room_number}}</h1>
                        <h1>จำนวนที่ใช้ต่อเดือน: {{p.power_use}} (Kw) </h1>
                        <h1>ราคาต่อหน่วย (Kw): {{p.unit}} บาท </h1>
                        <h1>ราคาร่วมทั้งหมด: {{p.total}} บาท</h1>
                        <h1>สถานะการจ่าย: {{p.statuspaid.status}}</h1>
                    </div>
                    <!-- <div class="">
                            <jet-label for="payment" value="ค่าเช้าห้องกับค่าเน็ต" />
                            <jet-input id="payment" type="number" class="mt-1 block w-full" v-model="form.payment"  v-bind:value="p.payment" required autofocus autocomplete="payment"  />
                        </div> -->
                       <div class="" >
                        <jet-label for="status_id" value="สถานะจ่าย"/>
                        <select v-model="form.status_id" id="status_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                            <option disabled value="">Please select one</option>
                            <option v-for="(s) in statuspaid" v-bind:value="s.id">{{s.status}}</option>

                        </select>
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
        
    },props:['electric','statuspaid'],
    methods:{
        submit(id){
            console.log(id);
            console.log(this.form)
            Inertia.post(route("water.edit",id),this.form,{
                forceFormData:true
            })
        }
    },
    data(){
        return {
            form:this.$inertia.form({
            //    power_use:'',
                status_id:'',
            })
        }
    }
})
</script>
