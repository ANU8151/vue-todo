<template>
  <div @click="todo.completed = !todo.completed">
            <div v-if="todo.completed">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-circle-check" width="28" height="28" viewBox="0 0 24 24" stroke-width="1.5" stroke="#00b341" fill="none" stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                <circle cx="12" cy="12" r="9" />
                <path d="M9 12l2 2l4 -4" />
              </svg>
            </div>
            <div v-else>
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-circle" width="28" height="28" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ff4500" fill="none" stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                <circle cx="12" cy="12" r="9" />
              </svg>
            </div>
          </div>
          <div :class="{ 'line-through': todo.completed }">{{ todo.title }}</div>
          <span @click="$emit('deleteTodo')"  class="px-2  cursor-pointer">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trash" width="28" height="28" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ff2825" fill="none" stroke-linecap="round" stroke-linejoin="round">
              <path stroke="none" d="M0 0h24v24H0z" fill="none" />
              <line x1="4" y1="7" x2="20" y2="7" />
              <line x1="10" y1="11" x2="10" y2="17" />
              <line x1="14" y1="11" x2="14" y2="17" />
              <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l1 -12" />
              <path d="M9 7v-3a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3" />
            </svg>
          </span>
</template>

<script>
export default {
  name: 'TodoItem',
  props: {
    todo: Object
  },
  emits: ['deleteTodo'],
  data() {
    return {
      
    }
  }
}
</script>
