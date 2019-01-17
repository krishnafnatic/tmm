<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}" />
  <title>{{ config('app.name', 'Laravel') }}</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="{{ asset( 'backend/bower_components/bootstrap/dist/css/bootstrap.min.css' ) }}" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ asset( 'backend/bower_components/font-awesome/css/font-awesome.min.css' ) }}" />
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset( 'backend/dist/css/AdminLTE.min.css' ) }}" />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <!-- ReCaptcha-->
  <script src="https://www.recaptcha.net/recaptcha/api.js" async defer></script>
</head>
<body class="hold-transition login-page">
  <!-- Content Wrapper. Contains page content -->
    @yield('content')
  <!-- /.content-wrapper -->
<!-- jQuery 3 -->
<script src="{{ asset( 'backend/bower_components/jquery/dist/jquery.min.js' ) }}"></script>
<!-- Bootstrap 3.3.7 -->
<script src="{{ asset( 'backend/bower_components/bootstrap/dist/js/bootstrap.min.js' ) }}"></script>
</body>
</html>