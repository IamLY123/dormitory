<template>
    <app-layout title="AddWater">
                <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                แจ้งค่านำ้
            </h2>
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
                        <div>
                            <jet-label for="power_use" value="จำนวนนำ้ที่ใช้ต่อหน่วย"/>
                            <jet-input id="power_use" type="number" class="mt-1 block w-full" v-model="form.power_use" required autocomplete="power_use" />
                        </div>
                         <!-- <div>
                            <jet-label for="total" value="Total"/>
                            <jet-input id="total" type="number" class="mt-1 block w-full" v-model="form.total"  required autocomplete="total" />
                            
                        </div> -->
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

    import { defineComponent } from 'vue'
    import {  Link,Head } from '@inertiajs/inertia-vue3';
import AppLayout from '../../Layouts/AppLayout.vue';
import { Inertia } from '@inertiajs/inertia';
import JetLabel from '@/Jetstream/Label.vue'
import JetButton from '@/Jetstream/Button.vue'
import JetInput from '@/Jetstream/Input.vue'
    export default defineComponent({
        components: {
           Link,
           Head,
                AppLayout,Inertia,JetLabel,JetButton,JetInput
        },
        data(){
            return {
                form:this.$inertia.form({
                    power_use:'',
                    // total:'',
                    room_rent_id:'',
                })
            }
        },
        props:['roomrents'],
            methods: {
            submit() {
             Inertia.post(route('water.store'),this.form,{
                forceFormData:true
            })
            }
   }
       
        
    })
</script>
