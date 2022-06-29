<template>
    <app-layout title="EditRenter">
        <template #header>
            <h2>แก้ไขผู้เข้าพักหอ</h2>
        </template>
        <div class="py-6">
            <div class="max-w-xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-3">
                    <div class="" v-for="(u) in roomrent" v-bind:value="u.id">
                       <h1 >ชื่อนามสกุล : {{u.user.fname}} {{u.user.lname}}</h1>
                       <h1>เลขห้อง : {{u.room.room_number}}</h1>
                       <h1>เวลาเข้าเช้า : {{moment(u.user.created_at).format('DD-MM-YYYY')}}</h1>
                       <form @submit.prevent="submit(u.id)">
                        <div class="">
                            <jet-label for="timeout" value="เวลาออก" />
                            <jet-input id="timeout" type="date" class="mt-1 block w-full" v-model="form.timeout"     />
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
import moment from 'moment'

export default defineComponent({
  components: { AppLayout,JetButton ,JetInput,JetLabel,Inertia},
    setup() {
        
    },
    props:['roomrent'],
    methods:{
        submit(id){
            console.log(id);
            console.log(this.form)
          return  Inertia.post(route("renter.edit",id),this.form,{
                forceFormData:true
            })
        }
    },
    data(){
        return {
            form:this.$inertia.form({
                // payment:'',
                timeout:'',
            }),moment
        }
    }
})
</script>
