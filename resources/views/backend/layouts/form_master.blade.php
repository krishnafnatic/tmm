<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}" />
  <title>{{ config('app.name') }}</title> 
  <!-- Tell the browser to be responsive to screen width width=device-width, initial-scale=1, shrink-to-fit=no -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="{{ asset( 'backend/bower_components/bootstrap/dist/css/bootstrap.min.css' ) }}" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ asset( 'backend/bower_components/font-awesome/css/font-awesome.min.css' ) }}" />
  <!-- Select2 -->
  <link rel="stylesheet" href="{{ asset( 'backend/bower_components/select2/dist/css/select2.min.css') }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset( 'backend/dist/css/AdminLTE.min.css' ) }}" />
  <!-- backend Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="{{ asset( 'backend/dist/css/skins/_all-skins.min.css' ) }}" />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="wrapper">
  @include('backend.elements.header')
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    @include('backend.elements.sidebar')
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  @yield('content')
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    @include('backend.elements.footer')
  </footer>
</div>
<!-- ./wrapper -->
<!-- jQuery 3 -->
<script src="{{ asset( 'backend/bower_components/jquery/dist/jquery.min.js' ) }}"></script>
<!-- Bootstrap 3.3.7 -->
<script src="{{ asset( 'backend/bower_components/bootstrap/dist/js/bootstrap.min.js' ) }}"></script> 
<!-- Select2 -->
<script src="{{ asset( 'backend/bower_components/select2/dist/js/select2.full.min.js') }}"></script>
<!-- FastClick -->
<script src="{{ asset( 'backend/bower_components/fastclick/lib/fastclick.js' ) }}"></script>
<!-- backend App -->
<script src="{{ asset( 'backend/dist/js/adminlte.min.js' ) }}"></script>
<!-- backend for demo purposes -->
<script src="{{ asset( 'backend/dist/js/demo.js' ) }}"></script>
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()
  });
</script>
</body>
</html>