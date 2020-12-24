<template>
  
      <input 
        @keyup.enter="addValue" 
        type="text" id="name" 
        class="border border-gray-200 h-8 px-2 focus:outline-none" 
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        autocomplete="off" 
      />
</template>

<script>
export default {
  props: ['modelValue'],
  emits: ['update:modelValue']
}
</script>

<style>

</style>