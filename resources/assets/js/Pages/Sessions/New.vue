<template>
	<div class="flex justify-center">
		<Head title="Log In" />
		<div
			class="w-full max-w-lg bg-white px-8 pt-6 pb-8 mb-4 shadow-md rounded"
		>
			<h3 class="text-xl font-semibold mb-8">Log In</h3>
			<form @submit.prevent="form.post('/login')">
				<div v-if="form.errors.login" class="mb-4">
					<p class="text-red-500 text-xs italic">
						{{ form.errors.login }}
					</p>
				</div>
				<div class="mb-4">
					<label
						class="block text-gray-700 text-sm font-bold mb-2"
						for="email"
					>
						Email
					</label>
					<input
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						:class="{ 'border-red-500 mb-3': form.errors.email }"
						v-model="form.email"
						id="email"
						type="email"
						placeholder="john@example.com"
					/>
					<p
						v-for="error in form.errors.email"
						class="text-red-500 text-xs italic"
					>
						{{ error.message }}
					</p>
				</div>
				<div class="mb-6">
					<label
						class="block text-gray-700 text-sm font-bold mb-2"
						for="password"
					>
						Password
					</label>
					<input
						class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
						:class="{ 'border-red-500 mb-3': form.errors.password }"
						v-model="form.password"
						id="password"
						type="password"
						placeholder="******************"
					/>
					<p
						v-for="error in form.errors.password"
						class="text-red-500 text-xs italic"
					>
						{{ error.message }}
					</p>
				</div>
				<div class="flex items-center justify-between">
					<button
						class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
						type="submit"
						:disabled="form.processing"
					>
						Log In
					</button>
				</div>
			</form>
		</div>
	</div>
</template>

<script setup>
import { Head, useForm } from "@inertiajs/vue3";
const form = useForm({ email: "", password: "" });
</script>
