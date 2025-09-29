<template>
  <div>
    <span
      v-for="(char, index) in text"
      :key="index"
      :style="{ animationDelay: index * delay + 's' }"
    >
      {{ char }}
    </span>
  </div>
</template>

<script>
export default {
  props: {
    text: {
      type: String,
      required: true
    },
    delay: {
      type: Number,
      default: 0.1
    }
  }
}
</script>
