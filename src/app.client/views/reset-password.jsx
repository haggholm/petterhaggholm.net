'use strict';

module.exports = (ctrl) => <form id="reset-form" action="/api/reset" method="POST">
  <input type="hidden" name="token" value={ ctrl.token }/>

  <fieldset class={ error ? 'form-group has-danger' : 'form-group' }>
    <label for="reset-email">Email</label>
    <input type="email" class="form-control" id="reset-email" name="email" placeholder="Email"
           value="{{email}}" readonly="readonly"/>
  </fieldset>

  <fieldset class="form-group">
    <label for="reset-password">Password</label>
    <input type="password" class="form-control" id="reset-password" name="password" placeholder="Password"/>
  </fieldset>

  <fieldset class="form-group">
    <label for="reset-password-confirm">Password</label>
    <input type="password" class="form-control" id="reset-password-confirm"
           name="confirm_password" placeholder="Password"/>
  </fieldset>

  <button type="submit" id="reset-btn" class="btn btn-primary">Save</button>
</form>;
