<template>
  <div class="lg:w-1/2 md:container sm:container mx-auto m-10 p-10 bg-gray-200">
    <div v-if="inputError" class="rounded bg-red-200 text-red-900 font-semibold p-2 text-center ">გთხოვთ შეიყვანოთ სიის ელემენტი</div>
    <h1 class="my-8 font-black text-3xl uppercase case-on">TODO აპლიკაცია</h1>
    <TextInput v-model="inputValue" />
    <div class="flex flex-col">
      <h1 class="text-3xl border-light-blue-800 border-b-4 mb-5">TODO List</h1>
      <ul class="space-y-3">
        <li v-for="el in valueList" :key="el.id" class="flex justify-between items-center text-medium font-normal h-10 rounded-lg px-2 bg-gray-100 shadow">
          <TodoItem :todo="el" />
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import TodoItem from './components/TodoItem.vue'
import TextInput from './components/TextInput.vue'

export default {
  name: 'App',
  components: {
    TodoItem,
    TextInput
  },
  data() {
    return {
      inputValue: "",
      valueList: [],
      inputError: false
    };
  },
  methods: {
    addValue() {
      if (this.inputValue !== "") {
        this.inputError = false;
        this.valueList.push({
          title: this.inputValue,
          completed: false
        });
        this.inputValue = "";
      } else {
        this.inputError = true;
      }
    }
  },
  mounted() {
    axios
      .get("https://jsonplaceholder.typicode.com/todos?userId=10")
      .then((response) => {
        this.valueList = response.data;
      });
  }
}
</script>
