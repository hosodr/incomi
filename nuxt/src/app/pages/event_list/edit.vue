<template>
  <div class="container">
    <form>
      <div class="form-group row">
        <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-10">
          <input
            id="inputEmail3"
            type="email"
            class="form-control"
            placeholder="Email"
          />
        </div>
      </div>
      <div class="form-group row">
        <label for="inputPassword3" class="col-sm-2 col-form-label"
          >Password</label
        >
        <div class="col-sm-10">
          <input
            id="inputPassword3"
            type="password"
            class="form-control"
            placeholder="Password"
          />
        </div>
      </div>
      <fieldset class="form-group">
        <div class="row">
          <legend class="col-form-label col-sm-2 pt-0">Radios</legend>
          <div class="col-sm-10">
            <div class="form-check">
              <input
                id="gridRadios1"
                class="form-check-input"
                type="radio"
                name="gridRadios"
                value="option1"
                checked
              />
              <label class="form-check-label" for="gridRadios1">
                First radio
              </label>
            </div>
            <div class="form-check">
              <input
                id="gridRadios2"
                class="form-check-input"
                type="radio"
                name="gridRadios"
                value="option2"
              />
              <label class="form-check-label" for="gridRadios2">
                Second radio
              </label>
            </div>
            <div class="form-check disabled">
              <input
                id="gridRadios3"
                class="form-check-input"
                type="radio"
                name="gridRadios"
                value="option3"
                disabled
              />
              <label class="form-check-label" for="gridRadios3">
                Third disabled radio
              </label>
            </div>
          </div>
        </div>
      </fieldset>
      <div class="form-group row">
        <div class="col-sm-2">Checkbox</div>
        <div class="col-sm-10">
          <div class="form-check">
            <input id="gridCheck1" class="form-check-input" type="checkbox" />
            <label class="form-check-label" for="gridCheck1">
              Example checkbox
            </label>
          </div>
        </div>
      </div>
      <div class="form-group row">
        <div class="col-sm-10">
          <button type="submit" class="btn btn-primary">Sign in</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
export default {}
</script>
