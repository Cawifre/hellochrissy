<template>
  <div>What is your name?</div>
  <input v-model="name" />
  <div v-if="name.length > 0">Hello, {{name}}{{maybeDecoration}}!</div>
</template>

<script>

export default {
  name: 'App',
  components: {
  },
  data: function () {
    return {
      name: "Friend"
    };
  },
  computed: {
    maybeDecoration: function () {
      var nameLowercase = this.name.toLowerCase();
      if (nameLowercase === "chrissy" || nameLowercase === "christina"){
        return "♥";
      }
      return "";
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
