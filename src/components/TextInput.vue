<template>
  
      <input 
        @keyup.enter="$emit('addTodo')" 
        type="text" id="name" 
        class="border border-gray-200 h-10 px-3 rounded focus:outline-none" 
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        autocomplete="off" 
      />
</template>

<script>
export default {
  props: ['modelValue'],
  emits: ['update:modelValue', 'addTodo']
}
</script>

<style>

</style>