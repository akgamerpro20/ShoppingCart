<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Admin</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" type="text/css" href="{{asset('css/LTE.css')}}">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<script src="{{asset('js/LTE.js')}}" type="text/javascript"></script>
</head>
<body class="hold-transition login-page">

  <style>

    .login-card-body .input-group .input-group-text, .register-card-body .input-group .input-group-text {
	    border-left: 1px solid whitesmoke !important;
    }

    .login-card-body .input-group .form-control, .register-card-body .input-group .form-control {
      border-left: none !important;
      border-right: 1px solid whitesmoke !important;
    }
	
  </style>

  <div class="login-box">
    <div class="login-logo">
      <a href="#"><b>Admin</b></a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
      <div class="card-body login-card-body">
        <p class="login-box-msg">Sign in to start your session</p>

        <form action="{{route('backend.post')}}" method="post">
      	  @csrf
          <div class="input-group mb-3">
        	  <div class="input-group-append input-group-text">
              <span class="fas fa-envelope"></span>
          	</div>
         	  <input id="email" type="email" class="form-control form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="Email" name="email" value="{{ old('email') }}" autofocus>

          	@if ($errors->has('email'))
          		<span class="invalid-feedback" role="alert">
          	 		<strong>{{ $errors->first('email') }}</strong>
         		  </span>
        	  @endif
          </div>
          <div class="input-group mb-3">
        	  <div class="input-group-append input-group-text">
              <span class="fas fa-lock"></span>
          	</div>
        	  <input id="password" type="password" class="form-control form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="Password" name="password">

          	@if ($errors->has('password'))
          		<span class="invalid-feedback" role="alert">
            		<strong>{{ $errors->first('password') }}</strong>
          		</span>
          	@endif
          </div>
          <div class="row">
            <div class="col-8">
              <div class="icheck-primary">
                <input type="checkbox" id="remember">
                <label for="remember">
                  Remember Me
                </label>
              </div>
            </div>
            <!-- /.col -->
            <div class="col-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
            </div>
            <!-- /.col -->
          </div>
        </form>

        <!-- <div class="social-auth-links text-center mb-3">
          <p>- OR -</p>
          <a href="#" class="btn btn-block btn-primary">
            <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
          </a>
          <a href="#" class="btn btn-block btn-danger">
            <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
          </a>
        </div> -->
        <!-- /.social-auth-links -->

        <!-- <p class="mb-1">
          <a href="#">I forgot my password</a>
          </p>
          <p class="mb-0">
            <a href="register.html" class="text-center">Register a new membership</a>
          </p> -->
      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
</body>
</html>
