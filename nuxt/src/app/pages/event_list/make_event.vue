<template>
  <div class="container">
    <div class="row justify-content-center mb-2">
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
        <div class="col-sm-6">
          <b-form-datepicker
            id="eventDatePicker"
            v-model="eventDate"
            :min="today"
          ></b-form-datepicker>
        </div>
        <div class="col-md-4">
          <b-form-timepicker
            v-model="eventTime"
            locale="en"
          ></b-form-timepicker>
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
            :min="today"
            placeholder="Start Date"
          ></b-form-datepicker>
        </div>
        <div class="col-md-5">
          <b-form-datepicker
            id="endDatePicker"
            v-model="endDate"
            :min="startDate"
            placeholder="End Date"
          ></b-form-datepicker>
        </div>
      </div>
      <div class="form-group row">
        <div class="col-md-2">
          <button type="button" class="btn btn-primary" @click="submit">
            Submit
          </button>
        </div>
        <div class="col-md-2">
          <button type="button" class="btn btn-primary" @click="cancel">
            Cancel
          </button>
        </div>
      </div>
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
      eventTime: '',
      startDate: '',
      endDate: '',
    }
  },
  computed: {
    today() {
      return new Date()
    },
    eventDateTime() {
      const date = new Date(this.eventDate)
      const time = this.eventTime.split(':')
      date.setHours(time[0])
      date.setMinutes(time[1])
      date.setSeconds(time[2])
      return date
    },
  },
  methods: {
    submit() {
      this.$router.replace('1')
    },
    cancel() {
      this.$router.back()
    },
  },
}
</script>
