<template>
    <app-layout title="ShowWater">
        <template #header>
            <h2>ข้อมูลค่านำ้</h2>
        </template>
        <div class="py-12 bg-white my-12 mx-48">
            <div class="max-w-3xl mx-auto bg-white">
                <table class="border-collapse border border-slate-400 " style="width:100%">
                    <thead>
                        <tr>
                            <th class="border border-slate-300 ... px-2" >เลขใบ</th>
                            <th class="border border-slate-300 ... px-2">เลขห้อง</th>
                            <th class="border border-slate-300 ... px-2">จำนวนนำ้ที่ใช้ต่อหน่วย</th>
                            <th class="border border-slate-300 ... px-2">ราคาต่อหน่วย (บาท)</th>
                            <th class="border border-slate-300 ... px-2">ค่านำ้(บาท)</th>
                            <th class="border border-slate-300 ... px-2">สถานะจ่าย</th>
                            <th class="border border-slate-300 ... px-2">เดือน</th>
                            <th class="border border-slate-300" colspan="2">จัดการ</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(e) in water" v-bind:value="e.id">
                            <td class="border border-slate-300 ... text-center ">{{e.id}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.roomrent.room.room_number}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.power_use}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.unit}}</td>
                            <td class="border border-slate-300 ... text-center">{{e.total}}</td>
                            <td class="border border-slate-300 ... text-center text-white bg-red-500" v-if="e.statuspaid.status=='unpaid'">{{e.statuspaid.status}}</td>
                            <td class="border border-slate-300 ... text-center text-white bg-green-500" v-else>{{e.statuspaid.status}}</td>
                             <td class="border border-slate-300 ... text-center">{{moment(e.created_at).format("MMMM")}}</td>
                            <td class="border border-slate-300 text-center"><div class="box-content my-2 py-2 px-2 mx-3 rounded bg-blue-500 text-white"><Link class="text-center" :href="route('update.water',e.id)">แก้ไข</Link></div></td>
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
import { Link } from '@inertiajs/inertia-vue3'
import JetButton from'@/Jetstream/Button.vue'
import JetLabel from'@/Jetstream/Label.vue'
import { Inertia } from '@inertiajs/inertia'

export default defineComponent({
  components: { AppLayout, Button ,Link,JetButton,JetLabel},
    setup() {
        
    },
    data(){
        return{
            moment:moment,
            form:this.$inertia.form({
                
            })
            
        }
    },

    props:['water'],
    methods:{
        submit(data){
            return Inertia.delete(route('delete.water',data),{
                onBefore:()=>confirm('Are you sure'),
            });
        }
    }
})
</script>
