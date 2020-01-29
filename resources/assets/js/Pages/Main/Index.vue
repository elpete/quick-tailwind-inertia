<template>
    <h2 class="text-xl">
        {{ welcomeMessage }}
    </h2>
</template>

<script>
import Layout from "@/Shared/Layout";

export default {
    layout: Layout,
    props: {
        welcomeMessage: {
            type: String,
            required: true
        }
    }
}
</script>
