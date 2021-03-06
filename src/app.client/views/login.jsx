'use strict';

module.exports = (ctrl) => <form id="login-form" action="/api/login" method="POST">
  <fieldset class={ ctrl.error ? 'form-group has-danger' : 'form-group' }>
    <label for="login-email">Email</label>
    <input type="email" class="form-control" id="login-email" name="email" placeholder="Email"/>
  </fieldset>

  <fieldset class={ ctrl.error ? 'form-group has-danger' : 'form-group' }>
    <label for="login-password">Password</label>
    <input type="password" class="form-control" id="login-password" name="password" placeholder="Password"/>
  </fieldset>

  <button type="submit" id="login-btn" class="btn btn-primary">Sign in</button>
  <button type="submit" value="forgot" id="login-forgot" class="btn btn-default">Forgot password</button>
</form>;
