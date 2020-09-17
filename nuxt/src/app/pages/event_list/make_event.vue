<template>
  <div class="container">
    <div class="row justify-content-center">
      <h1>Create a new event</h1>
    </div>
    <form>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="eventName">
          Event Name
        </label>
        <div class="col-sm-10">
          <input
            id="eventName"
            v-model="eventName"
            type="text"
            class="form-control"
            placeholder="a cool name for your event"
          />
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="eventDescription">
          Description
        </label>
        <div class="col-sm-10">
          <input
            id="eventDescription"
            v-model="eventDescription"
            type="text"
            class="form-control"
            placeholder="a short description for your event"
          />
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="eventDatePicker">
          Event Date
        </label>
        <div class="col-sm-10">
          <b-form-datepicker
            id="eventDatePicker"
            v-model="eventDate"
          ></b-form-datepicker>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label" for="startDatePicker">
          Period
        </label>
        <div class="col-md-5">
          <b-form-datepicker
            id="startDatePicker"
            v-model="startDate"
            placeholder="Start Date"
          ></b-form-datepicker>
        </div>
        <div class="col-md-5">
          <b-form-datepicker
            id="endDatePicker"
            v-model="endDate"
            placeholder="End Date"
          ></b-form-datepicker>
        </div>
      </div>
      <button type="button" class="btn btn-primary" @click="submit">
        Submit
      </button>
    </form>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      eventName: '',
      eventDescription: '',
      eventDate: '',
      startDate: '',
      endDate: '',
    }
  },
  methods: {
    submit() {
      this.$router.replace('1')
    },
  },
}
</script>
