<template>
    <app-layout title="ShowElectric">
        <template #header>
            <h2>ข้อมูลค่าไฟ้</h2>
        </template>
        <div class="py-12 bg-white my-12 mx-48">
            <div class="max-w-3xl mx-auto bg-white">
                <table class="border-collapse border border-slate-400 " style="width:100%">
                    <thead>
                        <tr>
                            <th class="border border-slate-300 ... px-2" >เลขใบ</th>
                            <th class="border border-slate-300 ... px-2">เลขห้อง</th>
                            <th class="border border-slate-300 ... px-2">จำนวนที่ใช้ต่อเดือน(Kw)</th>
                            <th class="border border-slate-300 ... px-2">ค่าไฟต่อหน่วย(บาท)</th>
                            <th class="border border-slate-300 ... px-2">ค่าไฟ(บาท)</th>
                            <th class="border border-slate-300 ... px-2">สถานะการจ่าย</th>
                            <th class="border border-slate-300 ... px-2">เดือน</th>
                            <th class="border border-slate-300" colspan="2">จัดการ</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(e) in electric" v-bind:value="e.id">
                            <td class="border border-slate-300 ... text-center ">{{e.id}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.roomrent.room.room_number}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.power_use}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.unit}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.total}}</td>
                            <td class="border border-slate-300 ... text-center bg-red-500 text-white" v-if="e.statuspaid.status=='unpaid'">{{e.statuspaid.status}}</td>
                                                        <td class="border border-slate-300 ... text-center bg-green-500 text-white" v-else>{{e.statuspaid.status}}</td>
                             <td class="border border-slate-300 ... text-center px-2">{{moment(e.created_at).format("MMMM")}}</td>
                            <td class="border border-slate-300 text-center "><div class="box-content my-2 py-2 px-2 mx-3 rounded bg-blue-500 text-white"><Link class="text-center" :href="route('update.electric',e.id)">แก้ไข</Link></div></td>
                            <td class="border border-slate-300 text-center">
                                <form @submit.prevent="submit(e.id)">
                                <jet-button class=" mx-2 my-2 bg-red-500 " :class="{'opacity-25': form.processing}" :disabled="form.processing">
                                ลบ
                            </jet-button>
                                </form>
                                </td>
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
import { Inertia } from '@inertiajs/inertia'
import JetButton from '@/Jetstream/Button.vue'
import { Link } from '@inertiajs/inertia-vue3'

export default defineComponent({
  components: { AppLayout, Button,Inertia,JetButton,Link },
    setup() {
        
    },
    data(){
        return{
            moment:moment,
            form:this.$inertia.form({

            })
        }
    },

    props:['electric'],
    methods:{
        submit(id){
            return Inertia.delete(route('delete.electric',id),{
                onBefore:()=>confirm('Are you sure'),
            });
        }
    }
})
</script>
