<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}" />
  <!-- viewport -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Title -->
  @if( !empty( $meta['meta_title'] ) )
    <title>{{ $meta['meta_title'] }} | {{ config('app.name', 'TheMoneyMile') }}</title>
  @else
    <title>{{ config('app.name', 'TheMoneyMile') }} | {{ config('app.message', 'TheMoneyMile') }}</title>
  @endif
  <!--no index follow -->
  <META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW" />
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" type="text/css" href="{{ asset( 'frontend/css/style.css' ) }}" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto" /> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous" />

  @if( !empty( $meta['meta_title'] ) )
    <meta name="author" content="{{ $meta['meta_title'] }}">
  @endif

  @if( !empty( $meta['meta_description'] ) )
    <meta name="description" content="{{ $meta['meta_description'] }}">
  @endif

  @if( !empty( $meta['meta_keyword'] ) )
    <meta name="keywords" content="{{ $meta['meta_keyword'] }}">
  @endif
</head>