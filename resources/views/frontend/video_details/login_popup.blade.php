<!-- Modal Login Start -->
  <div class="modal fade" id="user-login" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title text-center" id="exampleModalCenterTitle">{{ __( 'messages.sign_in' ) }}</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #000;">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body"> 
          <div class="alert alert-danger alert-block" id="danger" style="display: none;">
            
          </div>
          <div class="alert alert-success alert-dismissable" id="success" style="display: none;">
            
          </div>
          <div class="row justify-content-md-center">
            <div class="col">
                <div class="col-sm social-btn signin-social-btn-mr" style="margin-top: 10%;">
                  <a href="{{ route('auth.facebook') . '?previous=' . Request::fullUrl() }}#comments" class="btn btn-primary col fb-login">
                    <i class="fab fa-facebook-square fa-2x"></i>
                    <div>{{ __( 'messages.login_with_fb' ) }}</div>
                  </a>
                  <a href="{{ route('auth.google') . '?previous=' . Request::fullUrl() }}#comments" class="btn btn-primary col gmail-login">
                    <i class="fab fa-google fa-2x"></i>
                    <div>{{ __( 'messages.login_with_gg' ) }}</div>
                  </a>
                  <a href="{{ route('auth.linkedin') . '?previous=' . Request::fullUrl() }}#comments" class="btn btn-primary col linkedin-login">
                    <i class="fab fa-linkedin fa-2x"></i>
                    <div>{{ __( 'messages.login_with_li' ) }}</div>
                  </a>
                </div>
            </div> 
            <div class="col signup-box" id="signup"> 
              <div class="form-group" id="div_email">
                  <label class="form-control-label" for="email">{{ __( 'messages.email' ) }}</label>
                  <input type="email" class="form-control" name="email" id="email" autocomplete="off" autofocus required />
                  <span class="invalid-feedback" id="msg_email"></span>
              </div>

              <div class="form-group" id="div_pwd">
                  <label class="form-control-label" for="password">{{ __( 'messages.password' ) }}</label>
                  <input type="password" class="form-control" id="password"  name="password" autocomplete="current-password"  />
                  <span class="invalid-feedback" id="msg_password"></span>
                  <label class="remember-me" for="forget_password">
                     <a href="{{ route( 'password.request' ) }}"> {{ __( 'messages.forgot_password' ) }} </a>
                  </label>
              </div>

              <div class="form-group">
                  <input type="submit" class="btn btn-primary" value="{{ __( 'messages.sign_in' ) }}" id="loginAjax" onclick="return login();" />
              </div>
              <div class="form-group already-account">
                  {{ __( 'messages.account_yet' ) }}
                  <a href="{{ route( 'register' ) }}" class="">
                    {{ __( 'messages.sign_up' ) }}
                  </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<!-- Modal Login End --> 