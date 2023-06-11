<template>
    <div class="w-full h-screen flex justify-center items-center">
		<Head title="Home" />
        <h2 class="text-5xl">
            {{ welcomeMessage }}
        </h2>
    </div>
</template>

<script setup>
import { Head } from "@inertiajs/vue3";
defineProps({ welcomeMessage: String });
</script>
