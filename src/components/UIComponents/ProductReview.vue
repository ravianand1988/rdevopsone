<template>
  <div class="text-left">
    <b-form @submit.prevent="onSubmit" @reset="onReset">
      <div v-if="errors.length">
        <b>Please correct following error(s):</b>
        <ul>
          <li v-for="error in errors" :key="error" class="error"> {{error}} </li>
        </ul>
      </div>
      <b-form-group id="exampleInputGroup1"
                    label="Review:"
                    label-for="reviewInput"
                    description="We'll share your review with everyone.">
        <b-form-textarea id="reviewInput1"
                         type="text"
                         :rows="3"
                         :max-rows="6"
                         v-model="form.review"
                         placeholder="Enter your review..">
        </b-form-textarea>
      </b-form-group>
      <b-form-group id="exampleInputGroup2"
                    label="Your Name:"
                    label-for="exampleInput2">
        <b-form-input id="exampleInput2"
                      type="text"
                      v-model="form.name"
                      placeholder="Enter name">
        </b-form-input>
      </b-form-group>
      <b-form-group id="exampleInputGroup3"
                    label="Rating:"
                    label-for="ratingInput">
        <b-form-select id="ratingInput"
                       :options="ratings"
                       v-model.number="form.rating">
        </b-form-select>
      </b-form-group>
      <b-button type="submit" variant="primary">Submit</b-button>
      <b-button type="reset" variant="danger">Reset</b-button>
    </b-form>
  </div>
</template>

<script>
export default {
  name: 'ProductReview',
  data () {
    return {
      form: {
        name: null,
        review: null,
        rating: null
      },
      ratings: [
        {text: 'Select One', value: null},
        'Top', 'wonderful', 'acceptable', 'worst'
      ],
      errors: []
    }
  },
  methods: {
    onSubmit (evt) {
      if (this.form.name && this.form.review && this.form.rating) {
        let productReview = {
          name: this.form.name,
          review: this.form.review,
          rating: this.form.rating
        }
        this.$emit('review-submitted', productReview)
        console.debug(JSON.stringify(this.form))
        this.onReset()
      } else {
        this.errors = []
        if (!this.form.review) { this.errors.push('review is required.') }
        if (!this.form.name) { this.errors.push('Name is required.') }
        if (!this.form.rating) { this.errors.push('rating is required.') }
      }
    },
    onReset (evt) {
      /* Reset our form values */
      this.form.name = null
      this.form.review = null
      this.form.rating = null
      this.errors = []
    }
  }
}
</script>

<style scoped>
.error {
  color: orangered;
}
</style>
