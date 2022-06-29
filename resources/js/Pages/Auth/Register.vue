<template>
    <Head title="Register" />

    <jet-authentication-card>
        <template #logo>
            <svg class="w-24 h-24 mt-3" fill="orange" viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"></path>
                 </svg>
        </template>

        <jet-validation-errors class="mb-4" />

                    <form @submit.prevent="submit">
                    <div>
                        <jet-label for="fname" value="First Name" />
                        <jet-input id="fname" type="text" class="mt-1 block w-full" v-model="form.fname" required autofocus autocomplete="fname" />
                    </div>
                    <div>
                        <jet-label for="lname" value="Last Name" />
                        <jet-input id="lname" type="text" class="mt-1 block w-full" v-model="form.lname" required autofocus autocomplete="lname" />
                    </div>
                    <div>
                        <jet-label for="phone" value="Phone Number" />
                        <jet-input id="phone" type="text" class="mt-1 block w-full" v-model="form.phone" required autofocus autocomplete="phone" />
                    </div>
                        <div>
                        <jet-label for="address" value="Address" />
                        <jet-input id="address" type="text" class="mt-1 block w-full" v-model="form.address" required autofocus autocomplete="address" />
                    </div>
                        <div>
                        <jet-label for="dateofbirth" value="Date Of Birth" />
                        <jet-input id="dateofbirth" type="date" class="mt-1 block w-full" v-model="form.dateofbirth" required autofocus autocomplete="dateofbirth" />
                    </div>
                    <div>
                        <jet-label for="thai_id" value="Thai Id Card" />
                        <jet-input id="thai_id" type="text" class="mt-1 block w-full" v-model="form.thai_id" required autofocus autocomplete="thai_id" />
                    </div>
                    <div >
                        <jet-label for="statu" value="Status"/>
                        <select v-model="form.status" id="status" class="border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-md shadow-sm" >
                            <option disabled value="">Please select one</option>
                            <option value="1">Admin</option>
                            <option value="2">Renter</option>     
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
                            Register
                        </jet-button>
                    </div>
                </form>
    </jet-authentication-card>
</template>

<script>
    import { defineComponent } from 'vue'
    import JetAuthenticationCard from '@/Jetstream/AuthenticationCard.vue'
    import JetAuthenticationCardLogo from '@/Jetstream/AuthenticationCardLogo.vue'
    import JetButton from '@/Jetstream/Button.vue'
    import JetInput from '@/Jetstream/Input.vue'
    import JetCheckbox from '@/Jetstream/Checkbox.vue'
    import JetLabel from '@/Jetstream/Label.vue'
    import JetValidationErrors from '@/Jetstream/ValidationErrors.vue'
    import { Head, Link } from '@inertiajs/inertia-vue3';

    export default defineComponent({
        components: {
            Head,
            JetAuthenticationCard,
            JetAuthenticationCardLogo,
            JetButton,
            JetInput,
            JetCheckbox,
            JetLabel,
            JetValidationErrors,
            Link,
        },

        data() {
            return {
                form: this.$inertia.form({
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
                terms: false,
                })
            }
        },

        methods: {
            submit() {
                this.form.post(this.route('register'), {
                    onFinish: () => this.form.reset('password', 'password_confirmation'),
                })
            }
        }
    })
</script>
