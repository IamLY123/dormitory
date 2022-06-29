<template>
    <app-layout title="ShowPaymentRenter">
        <template #header>
            <h2>ดูค่าเช้าห้อง</h2>
        </template>
         <div class="py-12 bg-white my-12 mx-48">
            <div class="max-w-3xl mx-auto bg-white">
                <table class="border-collapse border border-slate-400 " style="width:100%">
                    <thead>
                        <tr>
                            <th class="border border-slate-300 ... px-2" >เลขใบ</th>
                            <th class="border border-slate-300 ... px-2">เลขห้อง</th>
                            <th class="border border-slate-300 ... px-2">ค่าที่ต้องจ่าย</th>
                            <th class="border border-slate-300 ... px-2">สถานะการจ่าย</th>
                            <th class="border border-slate-300 ... px-2">เดือน</th>
                         
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(e) in payments" v-bind:value="e.id">
                            <td class="border border-slate-300 ... text-center ">{{e.id}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.roomrent.room.room_number}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.payment}}</td>
                            <td class="border border-slate-300 ... text-center bg-red-500 text-white" v-if="e.statuspaid.status=='unpaid'">{{e.statuspaid.status}}</td>
                            <td class="border border-slate-300 ... text-center bg-green-500 text-white" v-else>{{e.statuspaid.status}}</td>
                            <td class="border border-slate-300 ... text-center">{{moment(e.created_at).format("MMMM")}}</td>
                          
                             
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </app-layout>
</template>
<script>
import moment from 'moment'
import { defineComponent } from 'vue'
import AppLayout from '../../Layouts/AppLayout.vue'
import JetButton from '@/Jetstream/Button.vue'
import { Inertia } from '@inertiajs/inertia'
import { Link } from '@inertiajs/inertia-vue3'

export default defineComponent({
  components: { AppLayout,JetButton,Inertia,Link},
    setup() {
        
    },
    props:['payments'],
    data(){
        return {
            moment,
            form:this.$inertia.form({})
        }
    },
    methods:{
        submit(id){
            console.log(id);
            return Inertia.delete(route('delete.payment',id),{
                onBefore:()=>confirm('Are you sure'),
            });
        }
    }
})
</script>
