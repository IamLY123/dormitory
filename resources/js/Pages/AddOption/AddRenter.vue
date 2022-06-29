<template>
    <app-layout title="AddRenter">
        <template #header>
            <h2>เพิ่มคนเข้าพัก</h2>
        </template>
        <div class="py-12">
            <div class="max-w-2xl mx-auto bg-white px-12 py-5">
                <form @submit.prevent="submit">
                    <div>
                        <jet-label for="fname" value="ชื่อ" />
                        <jet-input id="fname" type="text" class="mt-1 block w-full" v-model="form.fname" required autofocus autocomplete="fname" />
                    </div>
                    <div>
                        <jet-label for="lname" value="นามสกุล" />
                        <jet-input id="lname" type="text" class="mt-1 block w-full" v-model="form.lname" required autofocus autocomplete="lname" />
                    </div>
                    <div>
                        <jet-label for="phone" value="เบอร์โทร" />
                        <jet-input id="phone" type="text" class="mt-1 block w-full" v-model="form.phone" required autofocus autocomplete="phone" />
                    </div>
                        <div>
                        <jet-label for="address" value="ที่อยู่" />
                        <jet-input id="address" type="text" class="mt-1 block w-full" v-model="form.address" required autofocus autocomplete="address" />
                    </div>
                        <div>
                        <jet-label for="dateofbirth" value="วันเดือนปีเกิด" />
                        <jet-input id="dateofbirth" type="date" class="mt-1 block w-full" v-model="form.dateofbirth" required autofocus autocomplete="dateofbirth" />
                    </div>
                    <div>
                        <jet-label for="thai_id" value="บัตรประชาชนหรือเลขหนังสือเดินทาง" />
                        <jet-input id="thai_id" type="text" class="mt-1 block w-full" v-model="form.thai_id" required autofocus autocomplete="thai_id" />
                    </div>
                    <div >
                        <jet-label for="statu" value="สถานะสมัครในระบบ"/>
                        <select v-model="form.status" id="status" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                            <option disabled value="">Please select one</option>
                            <option value="1">Admin</option>
                            <option value="2">Renter</option>     
                        </select>

                    </div>
                      <div >
                        <jet-label for="room_id" value="เลขห้อง"/>
                        <select v-model="form.room_id" id="room_id" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                            <option disabled value="">Please select one</option>
                            <option v-for="(r) in rooms" v-bind:value="r.id">{{r.room_number}}</option>
                        </select>

                    </div>
                    <div class="mt-4">
                        <jet-label for="email" value="Email" />
                        <jet-input id="email" type="email" class="mt-1 block w-full" v-model="form.email" required />
                    </div>

                    <div class="mt-4">
                        <jet-label for="password" value="Password" />
                        <jet-input id="password" type="password" class="mt-1 block w-full" v-model="form.password" required autocomplete="new-password" />
                    </div>

                    <div class="mt-4">
                        <jet-label for="password_confirmation" value="Confirm Password" />
                        <jet-input id="password_confirmation" type="password" class="mt-1 block w-full" v-model="form.password_confirmation" required autocomplete="new-password" />
                    </div>

                    <div class="mt-4" v-if="$page.props.jetstream.hasTermsAndPrivacyPolicyFeature">
                        <jet-label for="terms">
                            <div class="flex items-center">
                                <jet-checkbox name="terms" id="terms" v-model:checked="form.terms" />

                                <div class="ml-2">
                                    I agree to the <a target="_blank" :href="route('terms.show')" class="underline text-sm text-gray-600 hover:text-gray-900">Terms of Service</a> and <a target="_blank" :href="route('policy.show')" class="underline text-sm text-gray-600 hover:text-gray-900">Privacy Policy</a>
                                </div>
                            </div>
                        </jet-label>
                    </div>

                    <div class="flex items-center justify-end mt-4">
                        <!-- <Link :href="route('login')" class="underline text-sm text-gray-600 hover:text-gray-900">
                            Already registered?
                        </Link> -->

                        <jet-button class="ml-4" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                            ลงทะเบียน
                        </jet-button>
                    </div>
                </form>
            </div>
        </div>
    </app-layout>  
</template>
<script>
import { defineComponent } from 'vue'
import AppLayout from '../../Layouts/AppLayout.vue'
import JetButton from '@/Jetstream/Button.vue'
import JetInput from '@/Jetstream/Input.vue'
import JetCheckbox from '@/Jetstream/Checkbox.vue'
import JetLabel from '@/Jetstream/Label.vue'
import JetValidationErrors from '@/Jetstream/ValidationErrors.vue'
import { Head, Link } from '@inertiajs/inertia-vue3';
import  {Inertia} from '@inertiajs/inertia';
export default defineComponent({
  components: { AppLayout,    JetButton,
            JetInput,
            JetCheckbox,
            JetLabel,
            JetValidationErrors,
            Link,
            Head,Inertia},
    setup() {
        
    },
    data(){
        return {
            form:this.$inertia.form({
                fname:'',
                lname:'',
                address:'',
                phone:'',
                thai_id:'',
                status:'',
                dateofbirth:'',
                email: '',
                password: '',
                password_confirmation: '',
                room_id:'',
                terms: false,
            })
        }
    },
    props:['rooms'],
    methods: {
            submit() {
                this.form.post(this.route('storerenter'), {
                    onFinish: () => this.form.reset('password', 'password_confirmation'),
                })
            }
   }

})
</script>
