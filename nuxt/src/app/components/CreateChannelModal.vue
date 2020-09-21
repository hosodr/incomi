<template>
  <div class="container">
    <form>
      <div class="form-group row">
        <label class="col-lg-2 col-form-label" for="eventName">
          Event Name
        </label>
        <div class="col-lg-10">
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
        <label class="col-lg-2 col-form-label" for="eventDescription">
          Description
        </label>
        <div class="col-lg-10">
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
        <label class="col-lg-2 col-form-label" for="eventDatePicker">
          Event Date
        </label>
        <div class="col-lg-6">
          <b-form-datepicker
            id="eventDatePicker"
            v-model="eventDate"
            :min="today"
          ></b-form-datepicker>
        </div>
        <div class="col-lg-4">
          <b-form-timepicker
            v-model="eventTime"
            locale="en"
          ></b-form-timepicker>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-lg-2 col-form-label" for="startDatePicker">
          Period
        </label>
        <div class="col-lg-5">
          <b-form-datepicker
            id="startDatePicker"
            v-model="startDate"
            :min="today"
            placeholder="Start Date"
          ></b-form-datepicker>
        </div>
        <div class="col-lg-5">
          <b-form-datepicker
            id="endDatePicker"
            v-model="endDate"
            :min="startDate"
            placeholder="End Date"
          ></b-form-datepicker>
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
