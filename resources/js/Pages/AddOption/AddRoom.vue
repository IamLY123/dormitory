<template>
    <app-layout title="AddRoom">
        <template #header>
             <h2 class="font-semibold text-xl text-gray-800 leading-tight"  >
                เพิ่มห้อง
             </h2>
        </template>
         <div class="py-6">
            <div class="max-w-xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-3">
                    <form @submit.prevent="submit">
                        <div>
                            <jet-label for="room_number" value="เลขห้อง" />
                            <jet-input id="room_number" type="text" class="mt-1 block w-full" v-model="form.room_number" required autofocus autocomplete="room_number" />
                        </div>
                        <div >
                            <jet-label for="floor_id" value="ชั้น"/>
                            <select v-model="form.floor_id" id="floor_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                                <option disabled value="">Please select one</option>
                                <option v-for="(f) in floors" v-bind:value="f.id">{{f.floor_name}}</option>
                            </select>
                        </div>
                           <div >
                            <jet-label for="size_id" value="ขนาดห้อง"/>
                            <select v-model="form.size_id" id="size_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                                <option disabled value="">Please select one</option>
                                <option v-for="(s) in sizes" v-bind:value="s.id">{{s.size}}</option>
                            </select>
                        </div>
                        <div >
                            <jet-label for="bed" value="เตียง"/>
                            <select v-model="form.bed_id" id="bed_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                                <option disabled value="">Please select one</option>
                                <option v-for="(b) in beds" v-bind:value="b.id">{{b.bed}}</option>
                            </select>
                        </div>
                        <div >
                            <jet-label for="status_id" value="สถานะห้อง"/>
                            <select v-model="form.status_id" id="status_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                                <option disabled value="">Please select one</option>
                                <option v-for="(st) in statuses" v-bind:value="st.id">{{st.status}}</option>
                            </select>
                        </div>
                            <div>
                            <jet-label for="price" value="ราคาห้องต่อเดือน" />
                            <jet-input id="price" type="text" class="mt-1 block w-full" v-model="form.price" required autofocus autocomplete="price" />
                        </div>
                            <div>
                            <jet-label for="detail" value="สิ่งที่มีอยู่ในห้อง" />
                            <textarea v-model="form.detail" id="detail" class="mt-1 block w-full border-gray-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" placeholder="add detail about room" required autofocus autocomplete="detail"></textarea>
                        </div>
                        <div >
                            <input type="file" @input="form.photo = $event.target.files[0]" class="mt-1 block w-full "/>
                                <progress v-if="form.progress" :value="form.progress.percentage" max="100">
                                {{ form.progress.percentage }}%
                                </progress>
                        </div>
                        <div class="flex items-center  mt-4">
                            <jet-button class="ml-4" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                เพิ่ม
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
import AppLayout from '../../Layouts/AppLayout.vue'
import { Link,Head } from '@inertiajs/inertia-vue3'
import JetButton from '@/Jetstream/Button.vue'
import JetInput from '@/Jetstream/Input.vue'
import JetCheckbox from '@/Jetstream/Checkbox.vue'
import JetLabel from '@/Jetstream/Label.vue'
import { useForm } from '@inertiajs/inertia-vue3'
import OptionAdd from '../../Jetstream/OptionAdd.vue'
import { Inertia } from '@inertiajs/inertia'
export default defineComponent({
  components: { useForm,AppLayout,Link,Head,JetButton,JetInput,JetCheckbox,JetLabel, OptionAdd },
   data() {
            return {
                form: this.$inertia.form({
                    room_number:'',
                    size_id:'',
                    floor_id:'',
                    bed_id:'',
                    detail:'',
                    price:'',
                    photo:'',
                    status_id:'',
                    // terms: false,

                }),
                
            }     
},
props:['beds','floors','sizes','statuses'],
methods:{
    submit(){
        Inertia.post(route('storeroom'),this.form,{
            forceFormData:true
        })
    }
}})
</script>
