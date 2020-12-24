<template>
  <div class="flex flex-col bg-gray-100 p-5 space-y-4 shadow mb-10">
      <label for="name" class="case-on">შეიყვანეთ სიის ელემენტი</label>
      <input @keyup.enter="addValue" type="text" id="name" class="border border-gray-200 h-8 px-2 focus:outline-none" v-model="inputValue" autocomplete="off" />
      <button class="h-11 bg-gray-300 rounded" v-on:click="addValue">დამატება</button>
    </div>
</template>

<script>
export default {

}
</script>

<style>

</style>