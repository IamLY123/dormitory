<template>
    <app-layout title="ShowGraph">
        <template #header>
            <h2>ดูยอดของหอ</h2>
        </template>
        <div class="my-5 mx-auto max-w-9xl" >
        <bar :bardata="electric" :userdata="users" :waterdata="waters" :paymentdata="payments"/>
        </div>
    </app-layout>
</template>
<script>
import { defineComponent } from 'vue'
import Bar from '../../Graph/Bar.vue'
import AppLayout from '../../Layouts/AppLayout.vue'

export default defineComponent({
  components: { AppLayout, Bar, },
    setup() {
        
    },
    props:['electric','users','waters','payments']
})
</script>
