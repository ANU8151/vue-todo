<template>
  <div class="lg:w-1/2 md:container sm:container mx-auto m-10 p-10">
    <div class="flex justify-center items-center">
      <Logo class="mr-4" />
      <h1 class="my-8 font-black text-3xl uppercase case-on">TODO აპლიკაცია</h1>
    </div>
    <div class="flex flex-col bg-gray-100 p-5 space-y-4 shadow mb-10">
      <label for="name" class="case-on font-semibold">შეიყვანეთ სიის ელემენტი</label>
      <div
        v-if="inputError"
        class="rounded bg-red-100 text-red-600 font-medium p-2 text-center"
      >
        შეცდომა: გთხოვთ შეიყვანოთ სიის ელემენტი
      </div>
      <TextInput
        v-model="inputValue"
        v-on:addTodo="addValue"
        :class="{ 'border-2 border-red-500': inputError }"
      />
      <button class="h-11 bg-gray-300 rounded" v-on:click="addValue">
        დამატება
      </button>
    </div>
    <div class="flex flex-col">
      <h1 class="text-3xl border-light-blue-800 border-b-4 mb-5">TODO List</h1>
      <ul class="space-y-3">
        <li
          v-for="(el, index) in valueList"
          :key="el.id"
          class="
            flex
            justify-between
            items-center
            text-medium
            font-normal
            h-16
            rounded-lg
            pl-6
            pr-3
            bg-gray-100
            shadow
          "
        >
          <TodoItem :todo="el" @deleteTodo="deleteTodo(index)" />
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import TodoItem from "./components/TodoItem.vue";
import TextInput from "./components/TextInput.vue";
import Logo from "./components/Logo.vue";

export default {
  name: "App",
  components: {
    TodoItem,
    TextInput,
    Logo,
  },
  data() {
    return {
      inputValue: "",
      valueList: [],
      inputError: false,
    };
  },
  methods: {
    addValue() {
      if (this.inputValue !== "") {
        this.inputError = false;
        this.valueList.push({
          title: this.inputValue,
          completed: false,
        });
        this.inputValue = "";
      } else {
        this.inputError = true;
      }
    },
    deleteTodo(el) {
      this.valueList.splice(el, 1);
      console.log(el);
    },
  },
  mounted() {
    axios
      .get("https://jsonplaceholder.typicode.com/todos?userId=9")
      .then((response) => {
        this.valueList = response.data;
      });
  },
};
</script>
