<template>
  <div class="ml-5 content">
    <h1 style="color: white;">Learning and Implementation Vue Mastery Course <b>Intro..</b></h1>
    <b-container>
      <div class="cart">
        <p>Cart({{cart.length}})</p>
      </div>
      <product :premium="premium" @add-to-cart="updateCart"
               @remove-from-cart="updateCartRemove"></product>
      <product :premium="premium" @add-to-cart="updateCart"
               @remove-from-cart="updateCartRemove"></product>
      <product :premium="premium" @add-to-cart="updateCart"
               @remove-from-cart="updateCartRemove"></product>
    </b-container>
  </div>
</template>

<script>
import Product from '../Components/UIComponents/Product'

export default {
  name: 'courseOneMastery',
  components: {
    Product
  },
  data () {
    return {
      premium: false,
      cart: []
    }
  },
  methods: {
    updateCart (variantId) {
      this.cart.push(variantId)
    },
    updateCartRemove (variantId) {
      if (this.cart.length) {
        this.cart.splice(0, 1)
      }
    }
  }
}
</script>

<style scoped>
body {
  font-family: tahoma;
  color: #282828;
  margin: 0px;
}

.nav-bar {
  background: linear-gradient(-90deg, #84CF6A, #16C0B0);
  height: 60px;
  margin-bottom: 15px;
}

.content {
  overflow-x: scroll;
  overflow-y: scroll;
}

.cart {
  margin-right: 25px;
  float: right;
  border: 1px solid #d8d8d8;
  padding: 5px 20px;
}
</style>
