
<template>
  <div>
    <h1>{{ header }}</h1>
    <h2> Domino's Pizza </h2>
    <p>
      Logéate con tu cuenta o crea una nueva.
    </p>
  </div>
</template>

<script>

export default {
  data () {
    return {
      header: '¡Bienvenido a las estadísticas de Dominos Pizza!'
    }
  }
}
</script>

<style scoped lang='scss'>
* {
  font-size: 16px;
}

h1 {
  font-size: 3em;
}

p {
  font-size: 1em;
}
</style>
