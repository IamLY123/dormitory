<template>
    <app-layout title="ShowRuleManage">
        <template #header>
            <h2>ข้อมูลกฏหอ</h2>
        </template>
        <div class="py-12 bg-white my-12 mx-48">
            <div class="max-w-3xl mx-auto bg-white">
                <table class="border-collapse border border-slate-400 " style="width:100%">
                    <thead>
                        <tr>
                            <th class="border border-slate-300 ... m-1 p-1" >เลขที่</th>
                            <th class="border border-slate-300 ...">ข้อมความ</th>
                            <th class="border border-slate-300" colspan="2">จัดการ</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(r) in rules" v-bind:value="r.id">
                            <td class="border border-slate-300 ... text-center">{{r.id}}</td>
                            <td class="border border-slate-300 ... text-center">{{r.content}}</td>
                            <td class="border border-slate-300 text-center "><div class="box-content my-2 py-2 px-2 mx-3 rounded bg-blue-500 text-white"><Link class="text-center" :href="route('update.rule',r.id)">แก้ไข</Link></div></td>
                            <td class="border border-slate-300 text-center">
                                <form @submit.prevent="submit(r.id)">
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
import { Link } from '@inertiajs/inertia-vue3'
import JetButton from '@/Jetstream/Button.vue'
import JetLabel from '@/Jetstream/Label.vue'
export default defineComponent({
  components: { AppLayout, Button,Link,JetButton, JetLabel },
    setup() {
        
    },

    props:['rules',],
    data(){
        return{
            moment,
            form:this.$inertia.form({

            })
        }
    },methods:{
        submit(id){
            Inertia.delete(route('delete.rule',id),{onBefore:()=>confirm("are you sure?")});
        }
    }
})
</script>
