<template>
    <app-layout title="EditRule">
        <template #header>
            <h2>แก้ไขกฏ</h2>
        </template>
                <div class="py-6">
            <div class="max-w-xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-3">
                    <div v-for="(p) in rules" v-bind:value="p.id">
                    <form @submit.prevent="submit(p.id)">
                    <div class="">
                            <jet-label for="content" value="ข้อความ" />
                            <jet-input id="content" type="text" class="mt-1 block w-full" v-model="form.content"   required autofocus autocomplete="content"  />
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
export default defineComponent({
  components: { AppLayout ,Inertia,JetButton,JetInput,JetLabel},
    setup() {
        
    },props:['rules'],
    methods:{
        submit(id){
            console.log(id);
            console.log(this.form)
            Inertia.post(route("rule.edit",id),this.form,{
                forceFormData:true
            })
        }
    },
    data(){
        return {
            form:this.$inertia.form({
                content:''
            })
        }
    }
})
</script>
