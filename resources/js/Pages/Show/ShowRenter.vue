<template>
    <app-layout title="ShowRenter">
        <template #header>
            <h2>ข้อมูลคนเข้าพัก</h2>
        </template>
        <div class="py-12 bg-white my-12 mx-48">
            <div class="max-w-3xl mx-auto bg-white">
                <table class="border-collapse border border-slate-400 " style="width:100%">
                    <thead>
                        <tr>
                            <th class="border border-slate-300 ... m-1 p-1" >เลขห้อง</th>
                            <th class="border border-slate-300 ...">ชื่อนามสกุล</th>
                            <th class="border border-slate-300 ...">เบอร์โทร</th>
                            <th class="border border-slate-300 ...">วันเดือนปีเข้าพัก</th>
                            <th class="border border-slate-300 ...">วันเดือนปีออก</th>
                            <th class="border border-slate-300" >จัดการ</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(r) in roomrents" v-bind:value="r.id">
                            <td class="border border-slate-300 ... text-center">{{r.room.room_number}}</td>
                            <td class="border border-slate-300 ... text-center">{{r.user.fname}} {{r.user.lname}}</td>
                            <td class="border border-slate-300 ... text-center">{{r.user.phone}}</td>
                            <td class="border border-slate-300 ... text-center">{{moment(r.user.created_at).format("DD-MM-YYYY")}}</td>
                            <td class="border border-slate-300 ... text-center bg-red-500" v-if="r.timeout!=null">{{r.timeout}}</td>
                            <td class="border border-slate-300 ... text-center " v-else-if="r.timeout===null">{{r.timeout}}</td>
                            <td class="border border-slate-300 text-center"><div class="box-content my-2 mx-3 rounded bg-blue-500 text-white"><Link class="text-center" :href="route('update.renter',r.id)">แก้ไข</Link></div> </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </app-layout>
</template>
<script>
import { defineComponent } from 'vue'
import AppLayout from '../../Layouts/AppLayout.vue'
import moment from "moment"
import Button from '../../Jetstream/Button.vue'
import { Link } from '@inertiajs/inertia-vue3'

export default defineComponent({
  components: { AppLayout, Button,Link },
    setup() {
        
    },
    data(){
        return {
            moment:moment
        }
    },
    props:['roomrents',],
})
</script>
