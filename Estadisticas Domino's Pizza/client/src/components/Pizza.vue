<template>
  <div>
    <h1 style="text-align: justify;">ESTADÍSTICAS DE PIZZAS MÁS VOTADAS</h1>
    <h2 style="text-align: justify;">¿CUALES DE NUESTRAS EXQUISITAS PIZZAS YA HAS DEGUSTADO?</h2>
    <br>
    <br>
    <h3 style="text-align: justify;">Pizza 4 quesos</h3>
    <p style="text-align: justify;"><img class="aligncenter wp-image-39941" src="//cupon.es/magazin/wp-content/uploads/sites/15/2016/07/pizza4quesos.jpg" alt="pizzas más populares" width="600" height="400" srcset="https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza4quesos.jpg 1200w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza4quesos-368x245.jpg 368w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza4quesos-768x512.jpg 768w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza4quesos-1120x747.jpg 1120w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza4quesos-500x333.jpg 500w" sizes="(max-width: 600px) 100vw, 600px" /></p>
               <button @click="suma4quesos()" id="edit">{{cont4quesos}}</button>

    <h3 style="text-align: justify;">Pizza Margherita</h3>
    <p style="text-align: justify;"><img class="aligncenter wp-image-39942" src="//cupon.es/magazin/wp-content/uploads/sites/15/2016/07/pizza-verde.jpg" alt="pizzas más populares" width="600" height="450" srcset="https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza-verde.jpg 1024w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza-verde-327x245.jpg 327w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza-verde-768x576.jpg 768w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza-verde-500x375.jpg 500w" sizes="(max-width: 600px) 100vw, 600px" /></p>
               <button @click="sumamargherita()" id="edit">{{contmargherita}}</button>

    <h3 style="text-align: justify;">Pizza Hawaiana</h3>
    <p style="text-align: justify;"><img class="aligncenter wp-image-39940 size-full" src="//cupon.es/magazin/wp-content/uploads/sites/15/2016/07/phw_d.jpg" alt="pizzas más populares" width="808" height="380" srcset="https://cupon.es/wp-content/uploads/sites/15/2016/07/phw_d.jpg 808w, https://cupon.es/wp-content/uploads/sites/15/2016/07/phw_d-520x245.jpg 520w, https://cupon.es/wp-content/uploads/sites/15/2016/07/phw_d-768x361.jpg 768w, https://cupon.es/wp-content/uploads/sites/15/2016/07/phw_d-500x235.jpg 500w" sizes="(max-width: 808px) 100vw, 808px" /></p>
                <button @click="sumahawaiana()" id="edit">{{conthawaiana}}</button>

    <h3 style="text-align: justify;">Pizza Carbonara</h3>
    <p style="text-align: justify;"><img class="aligncenter wp-image-39939" src="//cupon.es/magazin/wp-content/uploads/sites/15/2016/07/carbonara.jpg" alt="pizzas más populares" width="601" height="338" srcset="https://cupon.es/wp-content/uploads/sites/15/2016/07/carbonara.jpg 1920w, https://cupon.es/wp-content/uploads/sites/15/2016/07/carbonara-436x245.jpg 436w, https://cupon.es/wp-content/uploads/sites/15/2016/07/carbonara-768x432.jpg 768w, https://cupon.es/wp-content/uploads/sites/15/2016/07/carbonara-1120x630.jpg 1120w, https://cupon.es/wp-content/uploads/sites/15/2016/07/carbonara-500x281.jpg 500w" sizes="(max-width: 601px) 100vw, 601px" /></p>
                <button @click="sumacarbonara()" id="edit">{{contcarbonara}}</button>

    <h3 style="text-align: justify;">Pizza de Pepperoni</h3>
    <p style="text-align: justify;"><img class="aligncenter wp-image-39938" src="//cupon.es/magazin/wp-content/uploads/sites/15/2016/07/pizza-pepperoni.jpg" alt="pizzas más populares" width="600" height="400" srcset="https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza-pepperoni.jpg 1200w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza-pepperoni-368x245.jpg 368w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza-pepperoni-768x512.jpg 768w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza-pepperoni-1120x747.jpg 1120w, https://cupon.es/wp-content/uploads/sites/15/2016/07/pizza-pepperoni-500x333.jpg 500w" sizes="(max-width: 600px) 100vw, 600px" /></p>
             <button @click="sumapepperoni()" id="edit">{{contpepperoni}}</button>

  </div>
</template>

<script>
import UserService from '../services/userService'
export default {
  data () {
    return {
      header: 'Pizza',
      cont4quesos: 0,
      contmargherita: 0,
      conthawaiana: 0,
      contcarbonara: 0,
      contpepperoni: 0
    }
  },
  mounted () {
    // this.fetchData()
  },
  methods: {
    async createUser () {
      try {
        await UserService.createUser({
          name: this.newUser.name,
          gender: this.newUser.gender.g,
          birthday: this.newUser.bday
        })
        this.fetchData()
      } catch (e) {
        alert(e)
      }
    },
    async deleteUser (uName, index) {
      try {
        await UserService.deleteUser(uName)
        this.$delete(this.usersData, index)
      } catch (e) {
        alert(e)
      }
    },
    async editUser () {
      try {
        await UserService.editUser({
          name: this.actualUser.name,
          gender: this.actualUser.gender.g,
          birthday: this.actualUser.bday
        })
        this.fetchData()
      } catch (e) {
        alert(e)
      }
      this.isEditClicked = false
    },
    // contadores de los 5 tipos de pizzas
    suma4quesos () {
      this.cont4quesos++
      UserService.sendPizza({
        pizza_name: 'pizza4quesos', count: this.cont4quesos
      })
    },
    sumamargherita () {
      this.contmargherita++
      UserService.sendPizza({
        pizza_name: 'pizzamargherita', count: this.contmargherita
      })
    },
    sumahawaiana () {
      this.conthawaiana++
      UserService.sendPizza({
        pizza_name: 'pizzahawaiana', count: this.conthawaiana
      })
    },
    sumacarbonara () {
      this.contcarbonara++
      UserService.sendPizza({
        pizza_name: 'pizzacarbonara', count: this.contcarbonara
      })
    },
    sumapepperoni () {
      this.contpepperoni++
      UserService.sendPizza({
        pizza_name: 'pizzapepperoni', count: this.contpepperoni
      })
    },

    async fetchData () {
      const pizzaData = (await UserService.recoverCounts()).data.stadistics
      // this.usersData = pizzaData
      // matriz de pizzas en cada fila viene nombre y contador
      this.cont4quesos = pizzaData[0].count
      this.contmargherita = pizzaData[1].count
      this.conthawaiana = pizzaData[2].count
      this.contcarbonara = pizzaData[3].count
      this.contpepperoni = pizzaData[4].count
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

.create {
  margin: 1em;
}
label {
  display: block;
}

.tb {
  border:1px solid #dedede;
  display: table; width: 50%;
  margin: auto;
  padding: 1rem;
}

form {
  width: 40em;
  margin: auto;
  input {
    line-height: 1.5em;
    margin: 10px 0 10px 0;
  }
  select {
    width: 4em;
    height: 2em;
    margin: 10px auto 10px auto;
    display: block;
  }
}
</style>
