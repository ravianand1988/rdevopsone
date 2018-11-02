<template>
  <b-container>
    <div class="product">
      <div class="product-image">
        <a :href="imgLink"><img :src="imageCurrent"></a>
        <p v-if="premium" class="free-delivery">Shipping: Free Delivery for you only!!</p>
        <p v-else class="delivery">Shipping: 2.99</p>
      </div>
      <div class="product-info">
        <h1>{{ title}}</h1>
        <p>{{stock}}</p>
        <p v-if="sale"> Sale is On, 50% discount.</p>
        <ul class="text-left">
          <li v-for="detail in details" :key="detail"> {{detail}}</li>
        </ul>
        <h4 class="text-left">Colors</h4>
        <b-row class="ml-2">
          <b-col cols="2" v-for="(variant, index) in variants" :key="variant.id">
            <div class="color-box"
                 :style="{'background-color': variant.color}"
                 @mouseover="updateProduct(index)">
            </div>
          </b-col>
        </b-row>
        <h4 class="text-left">Select Size</h4>
        <b-row class="mt-2 ml-2">
          <b-col cols="1" v-for="size in sizes" :key="size"><span>{{size}}</span></b-col>
        </b-row>
      </div>
      <b-btn @click="addToCart" class="btn-primary ml-1"
             :class="{'disabled': isCart}"
             :disabled="isCart"> Add to Cart
      </b-btn>
      <b-btn @click="removeFromCart" variant="danger" class="btn-danger ml-1"
             :class="{'disabled': isCart}"
             :disabled="isCart">Remove
      </b-btn>
      <br/>
    </div>
    <div class="review-form text-left">
      <hr/>
      <h2>Reviews</h2>
      <p v-if="!reviews.length">There are no review yet!!</p>
      <ul>
        <li v-for="review in reviews" :key="review.name">
          <p>{{review.name}}</p>
          <p>{{review.rating}}</p>
          <p>{{review.review}}</p>
        </li>
      </ul>
    </div>
    <Review class="review-form" @review-submitted="addReview"></Review>
  </b-container>
</template>

<script>
import imgSocksgreen from '@/assets/img/vmSocks-green-onWhite.jpg'
import imgSocksblue from '@/assets/img/vmSocks-blue.jpg'
import Review from '../UIComponents/ProductReview'

export default {
  name: 'Product',
  props: {
    premium: {
      type: Boolean,
      default: false
    }
  },
  components: {
    imgSocksgreen,
    imgSocksblue,
    Review
  },

  data () {
    return {
      isadd: true,
      selectedVariant: 0,
      product: 'Socks',
      brand: '#ForMe',
      image: imgSocksblue,
      onSale: true,
      quantity: 5,
      imgLink: 'https://www.stylefile.com/converse/women/socks/converse-chucks-socks-blue-fid-200150.html',
      details: ['80% Cotton', '20% Polyester', 'Gender-neutral'],
      variants: [
        {
          id: 2234,
          color: 'green',
          image: imgSocksgreen,
          quantity: 5
        },
        {
          id: 2235,
          color: 'blue',
          image: imgSocksblue,
          quantity: 0
        }
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      reviews: []
    }
  },
  computed: {
    title () {
      return `${this.brand} ${this.product}`
    },
    stock () {
      let inStock = 'In Stock'
      if (this.variants[this.selectedVariant].quantity <= 10 && this.variants[this.selectedVariant].quantity > 0) {
        inStock = 'Almost sold out'
      } else {
        inStock = 'Out of stock'
      }
      return inStock
    },
    imageCurrent () {
      return this.variants[this.selectedVariant].image
    },
    sale () {
      return this.variants[this.selectedVariant].quantity <= 10 && this.variants[this.selectedVariant].quantity > 0
    },
    isCart () {
      return this.stock === 'Out of stock'
    }
  },
  methods: {
    addToCart () {
      this.$emit('add-to-cart', this.variants[this.selectedVariant].id)
    },
    removeFromCart () {
      this.$emit('remove-from-cart', this.variants[this.selectedVariant].id)
    },
    updateProduct (index) {
      this.selectedVariant = index
      console.log('selected variant: ', index)
    },
    addReview (review) {
      this.reviews.push(review)
    }
  }
}

</script>

<style scoped>

.product {
  display: flex;
  flex-flow: wrap;
  padding: 1rem;
}

img {
  border: 1px solid #d8d8d8;
  width: 70%;
  margin: 40px;
  box-shadow: 0px .5px 1px #d8d8d8;
}

.product-image {
  width: 80%;
}

.product-image,
.product-info {
  margin-top: 10px;
  width: 50%;
}

.color-box {
  width: 40px;
  height: 40px;
  margin-top: 5px;
}

button {
  margin-top: 30px;
  border: none;
  background-color: #1E95EA;
  color: white;
  height: 40px;
  width: 100px;
  font-size: 14px;
}

.disabledButton {
  background-color: #d8d8d8;
}

.review-form {
  width: 400px;
  padding: 20px;
  margin: 40px;
  border: 1px solid #d8d8d8;
}

input {
  width: 100%;
  height: 25px;
  margin-bottom: 20px;
}

textarea {
  width: 100%;
  height: 60px;
}

.tab {
  margin-left: 20px;
  cursor: pointer;
}

.activeTab {
  color: #16C0B0;
  text-decoration: underline;
}

.disabled {
  background-color: gray;
}

.free-delivery {
  background-color: yellow;
  font-weight: bold;
  color: #000;
}

.delivery {
  background-color: black;
  font-weight: bold;
  color: #fff;
  text-wrap: normal;
}
</style>
