<template>
 
        <div class="py-auto">
            <div class="max-w-xl mx-auto sm:px-6 lg:px-8 bg-white my-5">
                <h1 class="text-center pt-3 text-xl font-bold">กฏของหอพัก</h1>
                <div class="mx-5 py-5">
                <div v-for="(r) in rules" v-bind:value="r.id">
                    <h1 class="text-left">⌾<span class="pl-12">{{r.content}}</span></h1>
                </div>
                </div>
            </div>
        </div>
  
</template>
<script>
import { defineComponent } from 'vue'
import AppLayout from '../../Layouts/AppLayout.vue'

export default defineComponent({
  components: { AppLayout, },
  props:['rules'],
 
})
</script>
