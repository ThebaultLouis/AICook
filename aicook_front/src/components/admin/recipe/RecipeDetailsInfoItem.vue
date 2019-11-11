<template>
  <div class="col text-center">
    <div class="text-subtitle2">{{this.name}}</div>
    <div class="text-body1">{{this.value}}</div>
  </div>
</template>
<script>
export default {
  props: ["name", "value"]
};
</script>