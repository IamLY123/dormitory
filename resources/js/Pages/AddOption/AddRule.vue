<template>
    <app-layout title="AddRule">
        <template #header>
            <h2>เพิ่มกฏ</h2>
        </template>
        <div class="py-6">
            <div class="max-w-xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-3">
                    <form @submit.prevent="submit">
                        <div>
                            <jet-label for="content" value="ข้อความ"/>
                            <textarea v-model="form.content" id="content" class="mt-1 block w-full border-gray-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" placeholder="ระบุกฏที่นี้" required autofocus autocomplete="content"></textarea>
                        </div>
                        <div class="flex items-center mt-4">
                            <jet-button class="ml-4" :class="{'opacity-25': form.processing}" :disabled="form.processing">
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
import JetButton from '@/Jetstream/Button.vue'
import { Inertia } from '@inertiajs/inertia'
import JetLabel from '@/Jetstream/Label.vue'
export default defineComponent({
  components: { AppLayout ,JetButton,JetLabel},
    setup() {
        
    },
    data(){
        return {
            form: this.$inertia.form({
                content:'',
            })
        }
    },
    methods:{
        submit(){
            Inertia.post(route('storerule'),this.form,{
                forceFormData:true
            })
        }
    }
    
})
</script>
