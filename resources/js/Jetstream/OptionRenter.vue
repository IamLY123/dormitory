<template>
    <div>
        <div class="">
            <h1 class="bg-black text-white text-center text-xl">Show</h1>
        </div>
        <div class="bg-gray-200 bg-opacity-25 grid grid-cols-1 md:grid-cols-2">
            <div class="p-6 border">
                <div class="flex items-center">
       <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path></svg>
                    <div class="ml-4 text-lg text-gray-600 leading-7 font-semibold">
                        <Link :href="route('showmyelectric',$page.props.user.id)">ดูค่าไฟ้</Link>

                    </div>
                </div>

            </div>

            <div class="p-6 border-t border-gray-200 md:border-t-0 md:border-l border-b">
                <div class="flex items-center">
                   <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                    <div class="ml-4 text-lg text-gray-600 leading-7 font-semibold">
                        <!-- <a href="https://laracasts.com">แจ้งค่าไฟ้</a> -->
                        <Link :href="route('showmywater',$page.props.user.id)">ดูค่านำ้</Link>
                        </div>
                </div>
            </div>


                <div class="p-6 border-t border-gray-200 md:border-t-0 md:border-l border-r ">
                <div class="flex items-center">
                   <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                    <div class="ml-4 text-lg text-gray-600 leading-7 font-semibold">
                        <!-- <a href="https://laracasts.com">แจ้งค่าไฟ้</a> -->
                        <Link :href="route('showmypayment',$page.props.user.id)">ดูค่าเช้าห้อง</Link>
                        </div>
                </div>
            </div>

            
        </div>
    </div>
</template>

<script>
    import { defineComponent } from 'vue'
    import {  Link } from '@inertiajs/inertia-vue3';
    export default defineComponent({
        components: {
           Link,
        },
    })
</script>
