<template>
	<header
		class="bg-gray-900 sm:flex sm:justify-between sm:items-center sm:px-4 sm:py-3"
	>
		<div class="flex items-center justify-between px-4 py-3 sm:p-0">
			<Link
				href="/"
				class="text-white font-semibold flex flex-col sm:flex-row"
			>
				<span>Quick &bull; Tailwind &bull; Inertia</span>
				<span class="hidden sm:block">&nbsp;&mdash;&nbsp;</span>
				<span>Starter Template</span>
			</Link>
			<div class="sm:hidden">
				<button
					@click="isOpen = !isOpen"
					type="button"
					class="block text-gray-500 hover:text-white focus:text-white focus:outline-none"
				>
					<svg class="h-6 w-6 fill-current" viewBox="0 0 24 24">
						<path
							v-if="isOpen"
							fill-rule="evenodd"
							d="M18.278 16.864a1 1 0 0 1-1.414 1.414l-4.829-4.828-4.828 4.828a1 1 0 0 1-1.414-1.414l4.828-4.829-4.828-4.828a1 1 0 0 1 1.414-1.414l4.829 4.828 4.828-4.828a1 1 0 1 1 1.414 1.414l-4.828 4.829 4.828 4.828z"
						/>
						<path
							v-if="!isOpen"
							fill-rule="evenodd"
							d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"
						/>
					</svg>
				</button>
			</div>
		</div>
		<nav
			:class="isOpen ? 'block' : 'hidden'"
			class="px-2 pt-2 pb-4 sm:flex sm:p-0"
		>
			<Link
				v-if="!user"
				href="/registrations/new"
				class="block px-2 py-1 text-white font-semibold rounded hover:bg-gray-800"
				>Register</Link
			>
			<Link
				v-if="!user"
				href="/login"
				class="mt-1 block px-2 py-1 text-white font-semibold rounded hover:bg-gray-800 sm:mt-0 sm:ml-2"
				>Log In</Link
			>
			<Link
				v-if="user"
				href="/logout"
				class="mt-1 block px-2 py-1 text-white font-semibold rounded hover:bg-gray-800 sm:mt-0 sm:ml-2"
				>Log Out</Link
			>
		</nav>
	</header>
</template>

<script setup>
import { Link } from "@inertiajs/vue3";
import { ref, computed } from "vue";
import { usePage } from "@inertiajs/vue3";

const page = usePage();
const user = computed(() => page.props.auth.user);
const isOpen = ref(false);
</script>
