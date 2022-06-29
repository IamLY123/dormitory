<template>
    <app-layout title="Add">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Option
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                    <div v-if="$page.props.user.status==='admin'">
                    <option-add />
                    </div>
                    <div v-else>
                        <option-renter />
                    </div>

                </div>
            </div>
        </div>
    </app-layout>
</template>

<script>
    import { defineComponent } from 'vue'
    import AppLayout from '@/Layouts/AppLayout.vue'
    import Welcome from '@/Jetstream/Welcome.vue'
import OptionAdd from '../Jetstream/OptionAdd.vue'
import OptionRenter from '../Jetstream/OptionRenter.vue'

    export default defineComponent({
        components: {
            AppLayout,
            Welcome,
            OptionAdd,
                OptionRenter,
        },
        
    })
</script>
