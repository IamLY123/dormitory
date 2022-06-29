<template>
    <app-layout title="AddPayment">
        <template #header>
            <h2>แจ้งค่าเช้าห้อง</h2>
        </template>
         <div class="py-6">
            <div class="max-w-xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-3">
                    <form @submit.prevent="submit">
                    <div>
                    <jet-label for="room_rent_id" value="เลขห้อง"/>
                    <select v-model="form.room_rent_id" id="room_rent_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                        <option disabled value="">Please select one</option>
                        <option v-for="(r) in roomrents" v-bind:value="r.id">{{r.room.room_number}}</option>
                    </select>

                    </div>
                        <div class="flex items-center mt-4">
                            <jet-button class="ml-4" :class="{'opacity-25': form.processing}" :disabled="form.processing">
                                เพื่ม
                            </jet-button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </app-layout> 
</template>
<script>
import { Inertia } from '@inertiajs/inertia'
import { defineComponent } from 'vue'
import AppLayout from '../../Layouts/AppLayout.vue'
import JetLabel from '@/Jetstream/Label.vue'
import JetButton from '@/Jetstream/Button.vue'
import JetInput from '@/Jetstream/Input.vue'

export default defineComponent({
  components: { AppLayout ,Inertia,JetLabel,JetButton,JetInput},
    setup() {
        
    },
    props:['roomrents',],
  data(){
        return{
            form:this.$inertia.form({
                room_rent_id:'',
            })
        }
    },  methods:{
        submit(){
            return Inertia.visit(route('store.payment'),{method:'post',data:this.form
            });
        }
    },
    
})
</script>
